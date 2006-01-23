From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] kernel install.sh patch/enhancement?
Date: Mon, 23 Jan 2006 16:53:40 +0100
Message-ID: <ITJYTG$104D92B447D6B504FB5F1167C1BF3EF1@scarlet.be>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="_=__=_XaM3_.1138031620.2A.356503.42.6427.52.42.007.1649910115"
To: "parisc-linux" <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--_=__=_XaM3_.1138031620.2A.356503.42.6427.52.42.007.1649910115
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hello pa*,

Just some small hunck to (I hope) improve our kernel install.sh.

1/ align on the other arch:
--- arch/parisc/install.sh.Orig 2006-01-23 14:18:28.000000000 +0100
+++ arch/parisc/install.sh      2006-01-23 14:26:48.000000000 +0100
@@ -19,10 +19,28 @@
 #   $4 - default install path (blank if root directory)
 #
 
+verify () {
+       if [ ! -f "$1" ]; then
+               echo ""                                                  =
 1>&2
+               echo " *** Missing file: $1"                             =
 1>&2
+               echo ' *** You need to run "make" before "make install".'=
 1>&2
+               echo ""                                                  =
 1>&2
+               exit 1
+       fi
+}
+
+# Make sure the files actually exist
+verify "$2"
+verify "$3"
+
 # User may have a custom install script
 
-if [ -x ~/bin/installkernel ]; then exec ~/bin/installkernel "$@"; fi
-if [ -x /sbin/installkernel ]; then exec /sbin/installkernel "$@"; fi
+if [ -x ~/bin/${CROSS_COMPILE}installkernel ]; then
+       exec ~/bin/${CROSS_COMPILE}installkernel "$@"
+fi
+if [ -x /sbin/${CROSS_COMPILE}installkernel ]; then
+       exec /sbin/${CROSS_COMPILE}installkernel "$@"
+fi
 
 # Default install
 
=3D=3D=3D=3D<>=3D=3D=3D=3D

2/ append kernel version to filename (as many other arch too):
--- arch/parisc/install.sh.Orig 2006-01-23 14:30:17.000000000 +0100
+++ arch/parisc/install.sh      2006-01-23 15:30:30.000000000 +0100
@@ -19,6 +19,8 @@
 #   $4 - default install path (blank if root directory)
 #
 
+KCONF=3D".config"
+
 verify () {
        if [ ! -f "$1" ]; then
                echo ""                                                  =
 1>&2
@@ -32,6 +34,7 @@
 # Make sure the files actually exist
 verify "$2"
 verify "$3"
+verify "$KCONF"
 
 # User may have a custom install script
 
@@ -44,13 +47,18 @@
 
 # Default install
 
-if [ -f $4/vmlinux ]; then
-       mv $4/vmlinux $4/vmlinux.old
+if [ -f $4/vmlinux-$1 ]; then
+       mv $4/vmlinux-$1 $4/vmlinux.old
+fi
+
+if [ -f $4/System.map-$1 ]; then
+       mv $4/System.map-$1 $4/System.old
 fi
 
-if [ -f $4/System.map ]; then
-       mv $4/System.map $4/System.old
+if [ -f $4/config-$1 ]; then
+       mv $4/config-$1 $4/config.old
 fi
 
-cat $2 > $4/vmlinux
-cp $3 $4/System.map
+cat $2 > $4/vmlinux-$1
+cp $3 $4/System.map-$1
+cp .config $4/config-$1

3/ my paranoid check (because by /boot is a fs usualy mounted in ro, as I=

presume most of sysadm ;-?) 
--- arch/parisc/install.sh.Orig 2006-01-23 15:32:42.000000000 +0100
+++ arch/parisc/install.sh      2006-01-23 15:57:24.000000000 +0100
@@ -19,6 +19,26 @@
 #   $4 - default install path (blank if root directory)
 #
 
+# Verify default install path
+if [ -d $4 ]; then
+       cat /dev/null > $4/banner
+       RC=3D$?
+       if [ $RC -ne 0 ]; then
+               echo ""                                         1>&2
+               echo " *** Verify your access to $4"            1>&2
+               echo ""                                         1>&2
+               exit 1
+       else
+               rm -f $4/banner
+       fi
+else
+       echo ""                                                 1>&2
+       echo " *** Missing directory: $1"                       1>&2
+       echo ' *** You need to run "make -p $4" before.'        1>&2
+       echo ""                                                 1>&2
+       exit 1
+fi
+
 KCONF=3D".config"
 
 verify () {
@@ -62,3 +82,13 @@
 cat $2 > $4/vmlinux-$1
 cp $3 $4/System.map-$1
 cp .config $4/config-$1
+
+if [ -h $4/vmlinux ]; then
+       mv $4/vmlinux $4/vmlinux.prev
+       ln -sf $4/vmlinux-$1 $4/vmlinux
+fi
+
+if [ -h $4/System.map ]; then
+       mv $4/System.map $4/System.prev
+       ln -sf $4/System.map-$1 $4/System.map
+fi
=3D=3D=3D=3D<>=3D=3D=3D=3D

Don't hesistate to ci the stuff you fill of best interest (no cvs ci acce=
ss).

TIA,
    Joel
 
PS: also attached those 3 hunk because quiet sure of bad wraping, though.=
=0A=0A---------------------------------------------------------------=0AA=
 free anti-spam and anti-virus filter on all Scarlet mailboxes=0AMore inf=
o on http://www.scarlet.be/
--_=__=_XaM3_.1138031620.2A.356503.42.6427.52.42.007.1649910115
Content-Type: application/octet-stream;
	name="=?iso-8859-1?Q?arch=5Fparisc=5Finstall.sh.diff-1?="
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="=?iso-8859-1?Q?arch=5Fparisc=5Finstall.sh.diff-1?="

LS0tIGFyY2gvcGFyaXNjL2luc3RhbGwuc2guT3JpZwkyMDA2LTAxLTIzIDE0OjE4OjI4LjAw
MDAwMDAwMCArMDEwMAorKysgYXJjaC9wYXJpc2MvaW5zdGFsbC5zaAkyMDA2LTAxLTIzIDE0
OjI2OjQ4LjAwMDAwMDAwMCArMDEwMApAQCAtMTksMTAgKzE5LDI4IEBACiAjICAgJDQgLSBk
ZWZhdWx0IGluc3RhbGwgcGF0aCAoYmxhbmsgaWYgcm9vdCBkaXJlY3RvcnkpCiAjCiAKK3Zl
cmlmeSAoKSB7CisJaWYgWyAhIC1mICIkMSIgXTsgdGhlbgorCQllY2hvICIiCQkJCQkJCSAg
MT4mMgorCQllY2hvICIgKioqIE1pc3NpbmcgZmlsZTogJDEiCQkJCSAgMT4mMgorCQllY2hv
ICcgKioqIFlvdSBuZWVkIHRvIHJ1biAibWFrZSIgYmVmb3JlICJtYWtlIGluc3RhbGwiLicg
MT4mMgorCQllY2hvICIiCQkJCQkJCSAgMT4mMgorCQlleGl0IDEKKwlmaQorfQorCisjIE1h
a2Ugc3VyZSB0aGUgZmlsZXMgYWN0dWFsbHkgZXhpc3QKK3ZlcmlmeSAiJDIiCit2ZXJpZnkg
IiQzIgorCiAjIFVzZXIgbWF5IGhhdmUgYSBjdXN0b20gaW5zdGFsbCBzY3JpcHQKIAotaWYg
WyAteCB+L2Jpbi9pbnN0YWxsa2VybmVsIF07IHRoZW4gZXhlYyB+L2Jpbi9pbnN0YWxsa2Vy
bmVsICIkQCI7IGZpCi1pZiBbIC14IC9zYmluL2luc3RhbGxrZXJuZWwgXTsgdGhlbiBleGVj
IC9zYmluL2luc3RhbGxrZXJuZWwgIiRAIjsgZmkKK2lmIFsgLXggfi9iaW4vJHtDUk9TU19D
T01QSUxFfWluc3RhbGxrZXJuZWwgXTsgdGhlbgorCWV4ZWMgfi9iaW4vJHtDUk9TU19DT01Q
SUxFfWluc3RhbGxrZXJuZWwgIiRAIgorZmkKK2lmIFsgLXggL3NiaW4vJHtDUk9TU19DT01Q
SUxFfWluc3RhbGxrZXJuZWwgXTsgdGhlbgorCWV4ZWMgL3NiaW4vJHtDUk9TU19DT01QSUxF
fWluc3RhbGxrZXJuZWwgIiRAIgorZmkKIAogIyBEZWZhdWx0IGluc3RhbGwKIAo=

--_=__=_XaM3_.1138031620.2A.356503.42.6427.52.42.007.1649910115
Content-Type: application/octet-stream;
	name="=?iso-8859-1?Q?arch=5Fparisc=5Finstall.sh.diff-2?="
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="=?iso-8859-1?Q?arch=5Fparisc=5Finstall.sh.diff-2?="

LS0tIGFyY2gvcGFyaXNjL2luc3RhbGwuc2guT3JpZwkyMDA2LTAxLTIzIDE0OjMwOjE3LjAw
MDAwMDAwMCArMDEwMAorKysgYXJjaC9wYXJpc2MvaW5zdGFsbC5zaAkyMDA2LTAxLTIzIDE1
OjMwOjMwLjAwMDAwMDAwMCArMDEwMApAQCAtMTksNiArMTksOCBAQAogIyAgICQ0IC0gZGVm
YXVsdCBpbnN0YWxsIHBhdGggKGJsYW5rIGlmIHJvb3QgZGlyZWN0b3J5KQogIwogCitLQ09O
Rj0iLmNvbmZpZyIKKwogdmVyaWZ5ICgpIHsKIAlpZiBbICEgLWYgIiQxIiBdOyB0aGVuCiAJ
CWVjaG8gIiIJCQkJCQkJICAxPiYyCkBAIC0zMiw2ICszNCw3IEBACiAjIE1ha2Ugc3VyZSB0
aGUgZmlsZXMgYWN0dWFsbHkgZXhpc3QKIHZlcmlmeSAiJDIiCiB2ZXJpZnkgIiQzIgordmVy
aWZ5ICIkS0NPTkYiCiAKICMgVXNlciBtYXkgaGF2ZSBhIGN1c3RvbSBpbnN0YWxsIHNjcmlw
dAogCkBAIC00NCwxMyArNDcsMTggQEAKIAogIyBEZWZhdWx0IGluc3RhbGwKIAotaWYgWyAt
ZiAkNC92bWxpbnV4IF07IHRoZW4KLQltdiAkNC92bWxpbnV4ICQ0L3ZtbGludXgub2xkCitp
ZiBbIC1mICQ0L3ZtbGludXgtJDEgXTsgdGhlbgorCW12ICQ0L3ZtbGludXgtJDEgJDQvdm1s
aW51eC5vbGQKK2ZpCisKK2lmIFsgLWYgJDQvU3lzdGVtLm1hcC0kMSBdOyB0aGVuCisJbXYg
JDQvU3lzdGVtLm1hcC0kMSAkNC9TeXN0ZW0ub2xkCiBmaQogCi1pZiBbIC1mICQ0L1N5c3Rl
bS5tYXAgXTsgdGhlbgotCW12ICQ0L1N5c3RlbS5tYXAgJDQvU3lzdGVtLm9sZAoraWYgWyAt
ZiAkNC9jb25maWctJDEgXTsgdGhlbgorCW12ICQ0L2NvbmZpZy0kMSAkNC9jb25maWcub2xk
CiBmaQogCi1jYXQgJDIgPiAkNC92bWxpbnV4Ci1jcCAkMyAkNC9TeXN0ZW0ubWFwCitjYXQg
JDIgPiAkNC92bWxpbnV4LSQxCitjcCAkMyAkNC9TeXN0ZW0ubWFwLSQxCitjcCAuY29uZmln
ICQ0L2NvbmZpZy0kMQo=

--_=__=_XaM3_.1138031620.2A.356503.42.6427.52.42.007.1649910115
Content-Type: application/octet-stream;
	name="=?iso-8859-1?Q?arch=5Fparisc=5Finstall.sh.diff-3?="
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="=?iso-8859-1?Q?arch=5Fparisc=5Finstall.sh.diff-3?="

LS0tIGFyY2gvcGFyaXNjL2luc3RhbGwuc2guT3JpZwkyMDA2LTAxLTIzIDE1OjMyOjQyLjAw
MDAwMDAwMCArMDEwMAorKysgYXJjaC9wYXJpc2MvaW5zdGFsbC5zaAkyMDA2LTAxLTIzIDE1
OjU3OjI0LjAwMDAwMDAwMCArMDEwMApAQCAtMTksNiArMTksMjYgQEAKICMgICAkNCAtIGRl
ZmF1bHQgaW5zdGFsbCBwYXRoIChibGFuayBpZiByb290IGRpcmVjdG9yeSkKICMKIAorIyBW
ZXJpZnkgZGVmYXVsdCBpbnN0YWxsIHBhdGgKK2lmIFsgLWQgJDQgXTsgdGhlbgorCWNhdCAv
ZGV2L251bGwgPiAkNC9iYW5uZXIKKwlSQz0kPworCWlmIFsgJFJDIC1uZSAwIF07IHRoZW4K
KwkJZWNobyAiIgkJCQkJCTE+JjIKKwkJZWNobyAiICoqKiBWZXJpZnkgeW91ciBhY2Nlc3Mg
dG8gJDQiCQkxPiYyCisJCWVjaG8gIiIJCQkJCQkxPiYyCisJCWV4aXQgMQorCWVsc2UKKwkJ
cm0gLWYgJDQvYmFubmVyCisJZmkKK2Vsc2UKKwllY2hvICIiCQkJCQkJCTE+JjIKKwllY2hv
ICIgKioqIE1pc3NpbmcgZGlyZWN0b3J5OiAkMSIJCQkxPiYyCisJZWNobyAnICoqKiBZb3Ug
bmVlZCB0byBydW4gIm1ha2UgLXAgJDQiIGJlZm9yZS4nCTE+JjIKKwllY2hvICIiCQkJCQkJ
CTE+JjIKKwlleGl0IDEKK2ZpCisKIEtDT05GPSIuY29uZmlnIgogCiB2ZXJpZnkgKCkgewpA
QCAtNjIsMyArODIsMTMgQEAKIGNhdCAkMiA+ICQ0L3ZtbGludXgtJDEKIGNwICQzICQ0L1N5
c3RlbS5tYXAtJDEKIGNwIC5jb25maWcgJDQvY29uZmlnLSQxCisKK2lmIFsgLWggJDQvdm1s
aW51eCBdOyB0aGVuCisJbXYgJDQvdm1saW51eCAkNC92bWxpbnV4LnByZXYKKwlsbiAtc2Yg
JDQvdm1saW51eC0kMSAkNC92bWxpbnV4CitmaQorCitpZiBbIC1oICQ0L1N5c3RlbS5tYXAg
XTsgdGhlbgorCW12ICQ0L1N5c3RlbS5tYXAgJDQvU3lzdGVtLnByZXYKKwlsbiAtc2YgJDQv
U3lzdGVtLm1hcC0kMSAkNC9TeXN0ZW0ubWFwCitmaQo=

--_=__=_XaM3_.1138031620.2A.356503.42.6427.52.42.007.1649910115
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--_=__=_XaM3_.1138031620.2A.356503.42.6427.52.42.007.1649910115--
