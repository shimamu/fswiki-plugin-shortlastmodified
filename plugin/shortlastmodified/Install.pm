################################################################
#
# 表示項目が短いページの更新日時を表示するためのプラグインを提供します。
#
################################################################
package plugin::shortlastmodified::Install;
use strict;

sub install{
	my $wiki = shift;
	
	$wiki->add_inline_plugin("shortlastmodified", "plugin::shortlastmodified::ShortLastModified", "HTML");
}
1;
