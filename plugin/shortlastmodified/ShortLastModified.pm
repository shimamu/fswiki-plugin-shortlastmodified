####################################################################
#
# <p>ɽ����Υڡ����κǽ��������֤�ɽ�����ޤ���</p>
# <p>�����˥ڡ���̾���Ϥ����Ȥ�Ǥ��ޤ���</p>
# <pre>
# {{lastmodified page(�ڡ���̾��ά��)}}
# </pre>
#
####################################################################
package plugin::shortlastmodified::ShortLastModified;
use strict;

#==================================================================
# ���󥹥ȥ饯��
#==================================================================
sub new {
    my $class = shift;
    my $self = {};
    return bless $self,$class;
}

#==================================================================
# ����饤��᥽�å�
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
#   ���դ�&quot;yyyy/mm/dd hh:mm&quot;�����˥ե����ޥåȤ��ޤ���
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
