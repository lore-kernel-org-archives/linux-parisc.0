Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA08104
	for <parisc-linux@puffin.external.hp.com>; Wed, 28 Jun 2000 21:25:37 -0600
From: chester@linux.org.tw
Received: from tlug.sinica.edu.tw (HELO linux.org.tw) (root@140.109.13.42)
  by mailserv2.iuinc.com with SMTP; 29 Jun 2000 03:26:40 -0000
Received: from localhost (chester@localhost)
	by linux.org.tw (8.9.3/8.9.3) with ESMTP id LAA18949;
	Thu, 29 Jun 2000 11:28:26 +0800
Date: Thu, 29 Jun 2000 11:28:26 +0800 (CST)
To: parisc-linux@thepuffingroup.com
cc: chester@linux.org.tw
In-Reply-To: <Pine.BSO.4.21.0006281242220.12561-100000@mojo.calyx.net>
Message-ID: <Pine.LNX.4.10.10006291108220.17571-100000@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] userland test failure
List-ID: <linux-parisc.vger.kernel.org>

Hello ,
I have build the basic environment ,gcc, bintuils and glibc.
I download it from CVS ,and it builds very smooth.
(Thanks for your hack)
But when i compile a test program on it,i got some error:

-------(hello.c)
int main(void)
{
	printf("hello world");
	return 1;
}
--------
When i use hppa1.1-linux-gcc -g -o hello hello.c,it's fine.
(file hello ==> 
hello :ELF 32-bit MSB executable,PA-RISC, version 1,statically linked ,not
stripped)

But if i add -fPIC options,get

/tmp/cc4QxRpc.o : In function 'main'
/mnt/download/PA/hello.c:3: undefined reference to `$global$`
defaulting out
collect2: ld returned 1 exit status


BTW,i using this configure to configur my glibc,
./configure --preifix=/mnt/download/PA/pa-cross --disable-nls
--disable-sanity-checks --disable-shared --host=hppa1.1-linux
--target=hppa1.1-linux --build=i386-linux
--with-headers=/mnt/download/PA=pa-cross --without-nls --disable-profile

Is --disable-shared effect???



Thanks,
						Chester
