# coding: utf-8
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
#
require 'redmine'
require 'copy_roles_controller_patch'

object_to_prepare = Rails.configuration
Redmine::Plugin.register :sfl_role_members_batch_copy do

    name 'SFL Role Members Batch Copy'
    author 'David Côté-Tremblay'
    description 'Copy in batch members of a role to another role.'
    version '0.0.1'
    url 'https://gitlab.savoirfairelinux.com/redmine/SFL-Role-Members-Batch-Copy'
    author_url 'http://savoirfairelinux.com'

end
