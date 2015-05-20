node.reverse_merge!(
  nodejs: {
    path: '/usr/bin/nodejs',
    alias_dir: '/usr/local/bin'
  }
)

package 'nodejs' do
  action :install
end

link "#{node[:nodejs][:alias_dir]}/node" do
  to node[:nodejs][:path]
  not_if 'which node'
  only_if "test -x #{node[:nodejs][:path]}"
end
