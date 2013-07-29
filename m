From: Chen Gang <gang.chen@asianux.com>
Subject: [Suggestion] parisc: about the warnings "unsigned expression < 0
 is always false"
Date: Mon, 29 Jul 2013 16:39:29 +0800
Message-ID: <51F62A41.6090909@asianux.com>
References: <51EF8C52.50403@asianux.com> <1374674443.4634.3.camel@dabdike> <51F07332.6030908@gmail.com> <51F2D756.7040300@gmx.de> <51F5C158.3030303@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Parisc List <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <51F5C158.3030303@asianux.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello Maintainers:

Are the warnings real issue (I guess so, but don't know how to fix) ?

Please help check, thanks.

The cross compiler is built from (gcc-4.9.0 and binutils-2.23.2 with
'hppa-gchen-linux'), the related warnings (for 'allmodconfig'):

In file included from arch/parisc/math-emu/fmpyfadd.c:50:0:
arch/parisc/math-emu/fmpyfadd.c: In function 'dbl_fmpyfadd':
arch/parisc/math-emu/dbl_float.h:755:30: warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
  if ((unsigned int)(src1dstD += (src2D)) < (unsigned int)(src2D)) { \
                              ^
arch/parisc/math-emu/fmpyfadd.c:394:4: note: in expansion of macro 'Fourword_add'
    Fourword_add(tmpresp1, tmpresp2, tmpresp3, tmpresp4,
    ^
arch/parisc/math-emu/dbl_float.h:765:33: warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
     if ((unsigned int)(src1dstC += (src2C)) <   \
   
                              ^
:-)

Thanks.
--
Chen Gang
