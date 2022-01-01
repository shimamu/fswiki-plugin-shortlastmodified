####################################################################
#
# <p>表示中のページの最終更新時間を表示します。</p>
# <p>引数にページ名を渡すこともできます。</p>
# <pre>
# {{lastmodified page(ページ名省略可)}}
# </pre>
#
####################################################################
package plugin::shortlastmodified::ShortLastModified;
use strict;

#==================================================================
# コンストラクタ
#==================================================================
sub new {
    my $class = shift;
    my $self = {};
    return bless $self,$class;
}

#==================================================================
# インラインメソッド
#==================================================================
sub inline {
	my $self = shift;
	my $wiki = shift;
	my $page = shift;
	my $cgi  = $wiki->get_CGI;
	my $buf  = "";
	
	if(!defined($page) || $page eq ""){
		$page = $cgi->param("page");
	}
	
	if($page ne "" && $wiki->page_exists($page)){
		$buf .= format_date($wiki->get_last_modified2($page));
		$buf = '<div class="lastmodified">'. $buf . '</div>';
	}
	
	return $buf;
}


#===============================================================================
# <p>
#   日付を&quot;yyyy/mm/dd hh:mm&quot;形式にフォーマットします。
# </p>
# <pre>
# my $date = Util::format_date(time());
# </pre>
#===============================================================================
sub format_date {
	my $t = shift;
	my ($sec, $min, $hour, $mday, $mon, $year) = localtime($t);
	return sprintf("%04d.%02d.%02d %02d:%02d",
	               $year+1900, $mon+1, $mday, $hour, $min,$sec);
}

1;
