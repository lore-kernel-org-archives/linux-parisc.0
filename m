From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] DIFF use 6-regs in copy_user_page_asm
Date: Tue, 4 Jan 2005 14:12:40 +0100
Message-ID: <41C9680200002C6C@mail-2-bnl.tiscali.it>
References: <20050104082940.GF18497@tausq.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="========/41C9680200002C6C/mail-2-bnl.tiscali.it"
Cc: parisc-linux@lists.parisc-linux.org
To: "Randolph Chung" <randolph@tausq.org>,
 "Ryan Bradetich" <rbradetich@uswest.net>,
 "Grant Grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050104082940.GF18497@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


--========/41C9680200002C6C/mail-2-bnl.tiscali.it
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable


> -- Original Message --
> Date: Tue, 4 Jan 2005 00:29:40 -0800
> From: Randolph Chung <randolph@tausq.org>
> To: Ryan Bradetich <rbradetich@uswest.net>
> Cc: parisc-linux@lists.parisc-linux.org
> Reply-To: Randolph Chung <randolph@tausq.org>
> Subject: Re: [parisc-linux] DIFF use 6-regs in copy_user_page_asm
> 
> 
> > Is this something that would benefit older processors? Say a PCX-T
> > processor?  Is this something worth testing?  I'm pretty sure I 
> > have a PCX-T processor around I could boot up and test.
> 
> i have no idea, but we can test it and see. i've read some pdfs which
> suggest that all pa20 processors can do this reordering, but i don't
> know about pa11 processors. in any case, empirical results are always
> better than speculation :)
> 
This is only foreseen for pa2.0 ;-)

That said, I also tried re-ordering (with only 4 regs) on my c110 but tes=
t
case (previous cpup0.c) didn't show any improvement nor degradation !

Grant I also rewrite test case (here attached cpup1.c) to reproduce your
proposal and compare with present stuff in kernel and here are some resul=
ts:
patst005:/Develop/jso/Var/Comp# time ./cpup1 ; time ./cpup2

real    0m3.964s
user    0m0.209s
sys     0m3.753s

real    0m3.976s
user    0m0.190s
sys     0m3.781s
patst005:/Develop/jso/Var/Comp# time ./cpup2 ; time ./cpup1

real    0m3.946s
user    0m0.218s
sys     0m3.725s

real    0m3.961s
user    0m0.196s
sys     0m3.762s
patst005:/Develop/jso/Var/Comp# time ./cpup0 ; time ./cpup2 ; time ./cpup=
1

real    0m4.046s
user    0m0.354s
sys     0m3.691s

real    0m3.940s
user    0m0.225s
sys     0m3.712s

real    0m3.946s
user    0m0.208s
sys     0m3.734s
patst005:/Develop/jso/Var/Comp# time ./cpup0 ; time ./cpup1 ; time ./cpup=
2

real    0m4.068s
user    0m0.342s
sys     0m3.724s

real    0m3.948s
user    0m0.194s
sys     0m3.752s

real    0m3.936s
user    0m0.193s
sys     0m3.740s
patst005:/Develop/jso/Var/Comp# time ./cpup1 ; time ./cpup0 ; time ./cpup=
2

real    0m3.928s
user    0m0.202s
sys     0m3.725s

real    0m4.067s
user    0m0.329s
sys     0m3.731s

real    0m3.946s
user    0m0.224s
sys     0m3.718s
patst005:/Develop/jso/Var/Comp# time ./cpup2 ; time ./cpup0 ; time ./cpup=
1

real    0m3.942s
user    0m0.213s
sys     0m3.727s

real    0m4.086s
user    0m0.333s
sys     0m3.749s

real    0m3.956s
user    0m0.208s
sys     0m3.745s

Unfortunately (as in the previous test), I didn't reach to point out an
actual benefit :-(

(please note that I have to reduce the BUFFSIZE because my b2k has only
256Mb of ram ;-)

hth,
    Joel

-------------------------------------------------------------------------=
--
Tiscali solde! 1 mois et activation Gratuits, modem =E0 9,99=80
http://reg.tiscali.be/adsl/default.asp?lg=3DFR




--========/41C9680200002C6C/mail-2-bnl.tiscali.it
Content-Type: text/x-csrc
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="cpup1.c"

Ci8qCioqIENvUHkgVXNlciBQYWdlIGFzbSB0ZXN0ZXIKKioKKiogZ2NjIC1PMiAtbyBjcHVwMCBj
cHVwLmMJCXZhbmlsbGEgMzItYml0IGxvb3AKKiogCS1tYXJjaD0yLjAgLURMUDY0IC1vIGNwdXAx
CTY0LWJpdCwgNGxkICsgNHN0IHNlcXVlbmNlcwoqKgktbWFyY2g9Mi4wIC1ETFA2NCAtRFYxIC1v
IGNwdXAyCTY0LWJpdCwgNHJlZ3MsIDJsZC8yc3QgYnVuZGxlcwoqKiAJLW1hcmNoPTIuMCAtRExQ
NjQgLURVU0U2UkVHUyAtbyBjcHVwMyA2NC1iaXQsIDYgcmVncywgMmxkLzJzdCBidW5kbGVzCiov
CiNpbmNsdWRlIDxzdGRsaWIuaD4KI2luY2x1ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDxzdHJpbmcu
aD4KI2luY2x1ZGUgPGVycm5vLmg+CiNpbmNsdWRlIDxhc20vcGFnZS5oPgoKdm9pZCBfX2NvcHlf
dXNlcl9wYWdlX2FzbSh2b2lkICp0bywgdm9pZCAqZnJvbSkKewoJcmVnaXN0ZXIgdW5zaWduZWQg
bG9uZyBfX3RvIF9fYXNtX18gKCJyMjYiKSA9ICAodW5zaWduZWQgbG9uZyl0bzsKCXJlZ2lzdGVy
IHVuc2lnbmVkIGxvbmcgX19mcm9tIF9fYXNtX18gKCJyMjUiKSA9ICAodW5zaWduZWQgbG9uZylm
cm9tOwoKI2lmZGVmIExQNjQKCmFzbSB2b2xhdGlsZSAoImxkZAkJMCglMCksICUlcjE5XG4iCiIJ
bGRpCQkzMiwgJSVyMVxuIgoiMToJbGRkCQk4KCUwKSwgJSVyMjBcbiIKIglsZHcJCTI1NiglMCks
ICUlcjBcbiIKIglsZGQJCTE2KCUwKSwgJSVyMjFcbiIKIglsZGQJCTI0KCUwKSwgJSVyMjJcbiIK
I2lmZGVmIFVTRTZSRUdTCiIJbm9wXG4iCiIJbm9wXG4iCiIJbGRkCQkzMiglMCksICUlcjIzXG4i
CiIJbGRkCQk0MCglMCksICUlcjI0XG4iCiIJc3RkCQklJXIxOSwgMCglMSlcbiIKIglzdGQJCSUl
cjIwLCA4KCUxKVxuIgoiCWxkZAkJNDgoJTApLCAlJXIxOVxuIgoiCWxkZAkJNTYoJTApLCAlJXIy
MFxuIgoiCXN0ZAkJJSVyMjEsIDE2KCUxKVxuIgoiCXN0ZAkJJSVyMjIsIDI0KCUxKVxuIgoiCWxk
ZAkJNjQoJTApLCAlJXIyMVxuIgoiCWxkZAkJNzIoJTApLCAlJXIyMlxuIgoiCXN0ZAkJJSVyMjMs
IDMyKCUxKVxuIgoiCXN0ZAkJJSVyMjQsIDQwKCUxKVxuIgoiCWxkZAkJODAoJTApLCAlJXIyM1xu
IgoiCWxkZAkJODgoJTApLCAlJXIyNFxuIgoiCXN0ZAkJJSVyMTksIDQ4KCUxKVxuIgoiCXN0ZAkJ
JSVyMjAsIDU2KCUxKVxuIgoiCWxkZAkJIDk2KCUwKSwgJSVyMTlcbiIKIglsZGQJCTEwNCglMCks
ICUlcjIwXG4iCiIJc3RkCQklJXIyMSwgNjQoJTEpXG4iCiIJc3RkCQklJXIyMiwgNzIoJTEpXG4i
CiIJbGRkCQkxMTIoJTApLCAlJXIyMVxuIgoiCWxkZAkJMTIwKCUwKSwgJSVyMjJcbiIKIglzdGQJ
CSUlcjIzLCA4MCglJXIyNilcbiIKIglzdGQJCSUlcjI0LCA4OCglJXIyNilcbiIKIglsZG8JCTEy
OCglMCksICUwXG4iCiIJc3RkCQklJXIxOSwgIDk2KCUxKVxuIgoiCXN0ZAkJJSVyMjAsIDEwNCgl
MSlcbiIKIglzdGQJCSUlcjIxLCAxMTIoJTEpXG4iCiIJc3RkCQklJXIyMiwgMTIwKCUxKVxuIgoi
CWxkbwkJMTI4KCUxKSwgJTFcbiIKIglhZGRpYiw+CQktMSwgJSVyMSwgMWJcbiIKIglsZGQJCTAo
JTApLCAlJXIxOSIKI2Vsc2UJLyogIVVTRTZSRUdTICovIAoiCXN0ZAkJJSVyMTksIDAoJTEpXG4i
CiIJc3RkCQklJXIyMCwgOCglMSlcbiIKIglsZGQJCTMyKCUwKSwgJSVyMTlcbiIKIglsZGQJCTQw
KCUwKSwgJSVyMjBcbiIKIglzdGQJCSUlcjIxLCAxNiglMSlcbiIKIglzdGQJCSUlcjIyLCAyNCgl
MSlcbiIKIglsZGQJCTQ4KCUwKSwgJSVyMjFcbiIKIglsZGQJCTU2KCUwKSwgJSVyMjJcbiIKIglz
dGQJCSUlcjE5LCAzMiglMSlcbiIKIglzdGQJCSUlcjIwLCA0MCglMSlcbiIKIglsZGQJCTY0KCUw
KSwgJSVyMTlcbiIKIglsZGQJCTcyKCUwKSwgJSVyMjBcbiIKIglzdGQJCSUlcjIxLCA0OCglMSlc
biIKIglzdGQJCSUlcjIyLCA1NiglMSlcbiIKIglsZGQJCTgwKCUwKSwgJSVyMjFcbiIKIglsZGQJ
CTg4KCUwKSwgJSVyMjJcbiIKIglzdGQJCSUlcjE5LCA2NCglMSlcbiIKIglzdGQJCSUlcjIwLCA3
MiglMSlcbiIKIglsZGQJCSA5NiglMCksICUlcjE5XG4iCiIJbGRkCQkxMDQoJTApLCAlJXIyMFxu
IgoiCXN0ZAkJJSVyMjEsIDgwKCUxKVxuIgoiCXN0ZAkJJSVyMjIsIDg4KCUxKVxuIgoiCWxkZAkJ
MTEyKCUwKSwgJSVyMjFcbiIKIglsZGQJCTEyMCglMCksICUlcjIyXG4iCiIJc3RkCQklJXIxOSwg
OTYoJTEpXG4iCiIJc3RkCQklJXIyMCwgMTA0KCUxKVxuIgoiCWxkbwkJMTI4KCUwKSwgJTBcbiIK
IglzdGQJCSUlcjIxLCAxMTIoJTEpXG4iCiIJc3RkCQklJXIyMiwgMTIwKCUxKVxuIgoiCWxkbwkJ
MTI4KCUxKSwgJTFcbiIKIglhZGRpYiw+CQktMSwgJSVyMSwgMWJcbiIKIglsZGQJCTAoJTApLCAl
JXIxOSIKI2VuZGlmCS8qIFVTRTZSRUdTICovCgojZWxzZQkvKiAhTFA2NCAqLwoKYXNtIHZvbGF0
aWxlICgibGRpCQk2NCwgJSVyMVxuIgoiMToJbGR3CQkwKCUwKSwgJSVyMTlcbiIKIglsZHcJCTQo
JTApLCAlJXIyMFxuIgoiCWxkdwkJOCglMCksICUlcjIxXG4iCiIJbGR3CQkxMiglMCksICUlcjIy
XG4iCiIJc3R3CQklJXIxOSwgMCglMSlcbiIKIglzdHcJCSUlcjIwLCA0KCUxKVxuIgoiCXN0dwkJ
JSVyMjEsIDgoJTEpXG4iCiIJc3R3CQklJXIyMiwgMTIoJTEpXG4iCiIJbGR3CQkxNiglMCksICUl
cjE5XG4iCiIJbGR3CQkyMCglMCksICUlcjIwXG4iCiIJbGR3CQkyNCglMCksICUlcjIxXG4iCiIJ
bGR3CQkyOCglMCksICUlcjIyXG4iCiIJc3R3CQklJXIxOSwgMTYoJTEpXG4iCiIJc3R3CQklJXIy
MCwgMjAoJTEpXG4iCiIJc3R3CQklJXIyMSwgMjQoJTEpXG4iCiIJc3R3CQklJXIyMiwgMjgoJTEp
XG4iCiIJbGR3CQkzMiglMCksICUlcjE5XG4iCiIJbGR3CQkzNiglMCksICUlcjIwXG4iCiIJbGR3
CQk0MCglMCksICUlcjIxXG4iCiIJbGR3CQk0NCglMCksICUlcjIyXG4iCiIJc3R3CQklJXIxOSwg
MzIoJTEpXG4iCiIJc3R3CQklJXIyMCwgMzYoJTEpXG4iCiIJc3R3CQklJXIyMSwgNDAoJTEpXG4i
CiIJc3R3CQklJXIyMiwgNDQoJTEpXG4iCiIJbGR3CQk0OCglMCksICUlcjE5XG4iCiIJbGR3CQk1
MiglMCksICUlcjIwXG4iCiIJbGR3CQk1NiglMCksICUlcjIxXG4iCiIJbGR3CQk2MCgl
MCksICUlcjIyXG4iCiIJc3R3CQklJXIxOSwgNDgoJTEpXG4iCiIJc3R3CQklJXIyMCwgNTIoJTEp
XG4iCiIJc3R3CQklJXIyMSwgNTYoJTEpXG4iCiIJc3R3CQklJXIyMiwgNjAoJTEpXG4iCiIJbGRv
CQk2NCglMSksICUxXG4iCiIJYWRkaWIsPgkJLTEsICUlcjEsIDFiXG4iCiIJbGRvCQk2NCglMCks
ICUwIgojZW5kaWYJLyogTFA2NCAqLwoJOgkJCgk6ICJyIihfX2Zyb20pLCAiciIoX190bykgKTsK
fQoKI2RlZmluZSBCVUZGU0laRQkoMTAyNCoxMDI0KjY0KQojZGVmaW5lIFBQQgkJKEJVRkZTSVpF
L1BBR0VfU0laRSkJLyogUGFnZXMgUGVyIEJ1ZmYgKi8KCmludCBtYWluKGludCBhcmdjLCBjaGFy
ICogKiBhcmd2LCBjaGFyICogKiBlbnYpCnsKCgljaGFyICpNZW1TcmMsICpNZW1Ec3Q7Cgl1bnNp
Z25lZCBsb25nIGo7CgoJTWVtU3JjID0gbWFsbG9jKEJVRkZTSVpFKTsKCU1lbURzdCA9IG1hbGxv
YyhCVUZGU0laRSk7CgoJaWYgKE1lbVNyYyA9PSBOVUxMIHx8IE1lbURzdCA9PSBOVUxMKQoJCXJl
dHVybiAxOwoKCS8qIGluaXRpYWxpemUgZmlyc3QgcGFnZSBvZiBNZW1TcmMgKi8KCWZvciAoaiA9
IDA7IGogPCAoUEFHRV9TSVpFL3NpemVvZih1bnNpZ25lZCBsb25nKSkgOyBqKyspIHsKCQkoKHVu
c2lnbmVkIGxvbmcgKikgTWVtU3JjKVtqXT1qOwoJfQoKCS8qIGNsb25lIGZpcnN0IHBhZ2UgdG8g
cmVtYWluaW5nIHBhZ2VzIC0gcGFnZSBhdCBhIHRpbWUgKi8KCWZvciAoaiA9IDE7IGogPCBQUEIg
OyBqKyspIHsKCQlfX2NvcHlfdXNlcl9wYWdlX2FzbSggTWVtU3JjICsgKGoqUEFHRV9TSVpFKSwg
TWVtU3JjKTsKCX0KCgkvKiBDbG9uZSBTcmMgdG8gRGVzdCAtIHBhZ2UgYXQgYSB0aW1lICovCglm
b3IgKGogPSAwOyBqIDwgUFBCIDsgaisrKSB7CgkJX19jb3B5X3VzZXJfcGFnZV9hc20oIE1lbURz
dCArIChqKlBBR0VfU0laRSksCgkJCQkgICAgICBNZW1TcmMgKyAoaipQQUdFX1NJWkUpKTsKCX0K
CglmcmVlKE1lbVNyYyk7CglmcmVlKE1lbURzdCk7CglyZXR1cm4gMDsKfQoK

--========/41C9680200002C6C/mail-2-bnl.tiscali.it
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--========/41C9680200002C6C/mail-2-bnl.tiscali.it--
