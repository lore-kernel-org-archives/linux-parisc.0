Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA29348
	for <parisc-linux@puffin.external.hp.com>; Fri, 8 Sep 2000 16:23:05 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 8 Sep 2000 22:23:20 -0000
Received: from dhd by localhost with local (Exim 3.12 #1 (Debian))
	id 13XWYE-0002PQ-00
	for <parisc-linux@thepuffingroup.com>; Fri, 08 Sep 2000 18:23:14 -0400
To: parisc-linux@thepuffingroup.com
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 08 Sep 2000 18:23:12 -0400
Message-ID: <87lmx2ed67.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Subject: [parisc-linux] Looking for an IA-64 Linux user
List-ID: <linux-parisc.vger.kernel.org>

--=-=-=

Hi,

This is somewhat of a strange request, but I'm wondering if there are
any people running Linux on IA-64 who could compile and run this test
case for me and send me back the output and resulting binaries:


--=-=-=
Content-Type: application/x-gtar
Content-Disposition: attachment; filename=dltest.tar.gz
Content-Transfer-Encoding: base64
Content-Description: linker testcase

H4sIALpluTkAA+1XXW/bNhT1q/krbpUYlQzblWRbHuxmWOtubQH3A22HIUMAQRUpmxhNCpKcJRjS
394rSv5Ki7h9cIptPHoQRZ57eXQpHVFUFCwvHjWOCdcduKPhEM+uNxq65bnE+ly1R94w8Id9P8C2
5wbDoAHDo6qqscqLKANo0AW9k5cpVdyHnnsGrdZf8I+JUr34KHPgerrBYLC7/rvPged7/Xr98QiQ
5/luMGqAexQ1t/Ct639o/F8KLgWXDFYy53PJKAgl52TOijCN7UvFqUP+IbA/DFQVE0JOeEJZAmHI
+z8FYYisKF+CbcWREOAmF/KicMeQqhRargVjsM4yC2yMdZwJOWGCJ4DxODm1wzAS6SIKQ2eT5WOG
YZ11moPxizTdDy8ldFruN4bzKBjshi/VJU4PZ8BTmEy+Ei4pT5CdsWKVyaogN4SUBYOQS15satdM
My6LxLbO1QN4+XAJUQGtE3F1Ia0O1HUuU26iURL/MvrpNTsUzq4KhlqQD5HM/2bZhJTtBRNC2fEC
H/JYybyA9ipn2V7yFyWlA61cZ9XDk3J5ZbW+VW23dH2DwHOtJdUxuguDtpzyNm5xyq5t8Zp17dZa
b8iPfhX+l6j9/3jm3zjs/97Ar/zf7QeB7yHf64884//3gRMuY7GiDB5TkcSyt/iZbLvygnJVdpGt
q6ApDvxJ1bOMuLS1lWjvale7CLSBctBua+tx9rwH3/+tSVChUia5nKM/lOaBlmzbVQ6cpRq1rd56
c5IrdJF3H2bPwtmTP88dB87O4PXvs5kDKKCZ1FlRM8uyDli/ZpnKoJ4BNjnGa5+jgpUMbZ/NJrtC
0/bK5s2uwPx6ubwlUN+V1oeDtVycTndbB1VN1UpQkKrAb0euxCWrDPp7VH1YsPVaoMG2qI6rbN56
Fl0yy9l1YipiofL9e6j6WC3eubOAdfT3FVBfuNV36Uc/4QZ3ofb/V9FfuBkS7ChzHPB/tzT7av+P
/4le+f/ne67x/3vB9LfZk+fv0c66c+i+8aH7B27fyXSKPfM4JgSvxuPtyw94IqS+VJuBmDRP7enU
0Vli6CZvX06hq+D0Fzh9vOHn2wC1Ccjx64A/FmsydKVCB0IaIUgcwz57wxJUQDej1zJacpQZCxbJ
MW4qlzj5jtx2T0uG9idCem9fvHl9PgbNNbZkYGBgYGBgYGBgYGBgYGBgYGBgYGDwX8ZnJC4XTwAo
AAA=
--=-=-=


Basically I need to figure out how IA-64 handles shared object
constructors and destructors in practice.

Cheers

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.

--=-=-=--
