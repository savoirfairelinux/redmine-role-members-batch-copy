#
#    Copyright (C) 2014 Savoir-faire Linux Inc. (<www.savoirfairelinux.com>).
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as
#    published by the Free Software Foundation, either version 3 of the
#    License, or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
require_dependency 'roles_controller'

module CopyRolesControllerPatch

    def self.included(base)
        base.send(:include, InstanceMethods)
    end

    module InstanceMethods

        def validate_copy_members
            @role = Role.find(params[:from])
            @target_role = Role.find(request.POST['copy']['role_id'])
            @remove_from_source = request.POST['copy']['remove_from_source'].to_i == 1
            @overview = MemberRole.joins(:member).where(:role => @role).group(:id).group_by{ |o| o.member.project }
        end

        def do_copy_members

            unless request.POST['copy']['legitimate'].to_i == 1 then
                flash[:error] = l(:security_validation_box_not_checked)
                return redirect_to action: 'edit', id: params[:from]
            end

            @role = Role.find(params[:from])
            @target_role = Role.find(request.POST['copy']['role_id'])

            @role.members.each do |member|
                scheme = {:member_id => member.id, :role_id => @target_role.id}
                if MemberRole.where(scheme).empty? then
                    MemberRole.new(scheme).save
                end
                if request.POST['copy']['remove_from_source'].to_i == 1 then
                    source_member_role = MemberRole.where(:member_id => member.id, :role_id => @role.id).take
                    source_member_role.delete
                end
            end

            flash[:notice] = l(:members_successfully_copied)
            return redirect_to action: 'edit', id: params[:from]

        end

    end
end

RolesController.send :include, CopyRolesControllerPatch
