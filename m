From: Denys Vlasenko <vda.linux@googlemail.com>
Subject: parisc: orphaned asm/compat_signal.h file?
Date: Mon, 24 Sep 2012 14:39:49 +0200
Message-ID: <CAK1hOcMongS_p5+oiaqE85tEVF8mv+SCm3yb-N=Zqz4Xuz_+WA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: "James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

I noticed the following:

In linux-mmotm and parisc-2.6.git trees,
arch/parisc/include/asm/compat_signal.h file is just:


/* Use generic */
#include <asm-generic/compat_signal.h>


which isn't correct since asm-generic/compat_signal.h doesn't exist.

Nobody noticed this because arch/parisc/include/asm/compat_signal.h
itself is not included by any other file.

Maybe it needs to be removed?

-- 
vda
