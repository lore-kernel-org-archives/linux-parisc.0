Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA27301
	for <parisc-linux@puffin.external.hp.com>; Wed, 11 Oct 2000 09:55:20 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 11 Oct 2000 15:56:24 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id CAA02950;
	Thu, 12 Oct 2000 02:55:58 +1100
Date: Thu, 12 Oct 2000 02:55:58 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Markus Werle <markus@lufmech.rwth-aachen.de>
cc: binutils@sourceware.cygnus.com, parisc-linux@thepuffingroup.com
Subject: Re: 64 bit BFD configuration failure on hpux-11.0
In-Reply-To: <39E47AC9.156577A9@lufmech.rwth-aachen.de>
Message-ID: <Pine.LNX.4.21.0010120250340.29523-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 11 Oct 2000, Markus Werle wrote:

> cc +DA2.0w +DS2.0w -Ae -o size size.o bucomm.o version.o filemode.o
> ../bfd/.libs/libbfd.a ../libiberty/libiberty.a ./../intl/libintl.a -lm
> ld: Unsatisfied symbol "alloca" in file
> ../bfd/.libs/libbfd.a[elf64-hppa.o]
> 1 errors.

This should fix it

--- bfd/elf64-hppa.c~	Tue Sep  5 11:54:49 2000
+++ bfd/elf64-hppa.c	Thu Oct 12 01:19:35 2000
@@ -17,6 +17,7 @@
 along with this program; if not, write to the Free Software
 Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  */
 
+#include "alloca-conf.h"
 #include "bfd.h"
 #include "sysdep.h"
 #include "libbfd.h"


I'll commit this to CVS tomorrow morning - this morning I mean, after I've
had a sleep.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
