Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.itp.bg (itp.solo.bg [212.72.196.10])
	by dsl2.external.hp.com (Postfix) with SMTP id 2007D485F
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Jul 2002 13:48:10 -0600 (MDT)
Date: Thu, 11 Jul 2002 22:49:15 +0300
From: "Stephan Trajkoff" <stephan@itp.bg>
To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Message-Id: <20020711194810.2007D485F@dsl2.external.hp.com>
Subject: [parisc-linux] Not working PHP, security hole
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Please admins of parisc-linux to fix their problem
<?
$_db_host=3D"localhost";
#$_db_host=3D"puffin.external.hp.com";
$_db_user=3D"parisc";
$_db_password=3D"parisc";
$_db_database=3D"hw";
$_db_connection=3D"_db_unconnected";

$_db_result=3D"";
$_db_row=3D"";

Function connectDatabase(){
 global $_db_host;
 global $_db_user;
 global $_db_password;
 global $_db_connection;
 if($_db_connection=3D=3D"_db_unconnected"){
  $_db_connection=3Dmysql_connect
($_db_host,$_db_user,$_db_password);
  }
 }

Function queryDatabase($query){
 global $_db_database;
 global $_db_result;
 $_db_result =3D mysql_db_query($_db_database,$query);
 return $_db_result;
 }

Function nextRow($result =3D "_db_unset"){
 global $_db_result;
 global $_db_row;

 if($result=3D=3D"_db_unset"){
  $_db_row =3D mysql_fetch_object($_db_result);
  }
 elseif(is_integer($result)){
  $_db_row =3D mysql_fetch_object($result);
  }
 else {
  return "";
  }
 return $_db_row;
 }

Function numRows($result =3D "_db_unset"){
 global $_db_result;

 if($result=3D=3D"_db_unset"){
  return mysql_num_rows($_db_result);
  }
 elseif(is_integer($result)){
  return mysql_num_rows($result);
  }
 return "";
 }

Function disconnectDatabase(){
 global $_db_result;
 global $_db_connection;
 mysql_free_result($_db_result);
 mysql_close($_db_connection);
 }

Function insertId(){
 return mysql_insert_id();
 }

Function escapeString($instring){
 return AddSlashes($instring);
 }
?>
use apachetoolbox to compile apache php mysql
www.apachetoolbox.com

-------------------------------------------------------------------
-->> Add WEB ACCESS to your POP email accounts with
-->> FREE Perl CGI scripts! Download today! http://www.adjeweb.com
-------------------------------------------------------------------
