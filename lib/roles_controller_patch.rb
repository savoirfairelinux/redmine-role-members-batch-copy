require_dependency 'roles_controller'

module RolesControllerPatch

    def self.included(base)
        base.send(:include, InstanceMethods)
    end

    module InstanceMethods

        def copy_members

            unless request.POST['copy']['legitimate'].to_i == 1 then
                flash[:error] = l(:security_validation_box_not_checked)
                return redirect_to action: 'edit', id: params[:from]
            end

            source_role = Role.find(params[:from])
            target_role = Role.find(request.POST['copy']['role_id'])

            source_role.members.each do |member|
                scheme = {:member_id => member.id, :role_id => target_role.id}
                if MemberRole.where(scheme).empty? then
                    MemberRole.new(scheme).save
                end
            end

            flash[:notice] = l(:members_successfully_copied)
            return redirect_to action: 'edit', id: params[:from]

        end

    end
end

RolesController.send :include, RolesControllerPatch
