################################################################
#
# ɽ�����ܤ�û���ڡ����ι���������ɽ�����뤿��Υץ饰������󶡤��ޤ���
#
################################################################
package plugin::shortlastmodified::Install;
use strict;

sub install{
	my $wiki = shift;
	
	$wiki->add_inline_plugin("shortlastmodified", "plugin::shortlastmodified::ShortLastModified", "HTML");
}
1;
