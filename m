Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.iinet.net.au (symphony-01.iinet.net.au [203.59.24.16])
	by dsl2.external.hp.com (Postfix) with SMTP id 7899C482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Jun 2001 10:24:41 -0600 (MDT)
Received: (from andrew@localhost)
	by guinness.internal.neep.com.au (8.9.3/8.9.3/Debian/GNU) id AAA27486
	for parisc-linux@lists.parisc-linux.org; Tue, 19 Jun 2001 00:24:33 +0800
Date: Tue, 19 Jun 2001 00:24:29 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Burning a CD image ?
Message-ID: <20010619002427.F391@neep.com.au>
References: <F209l06sIQrttDRdNOU00012e19@hotmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <F209l06sIQrttDRdNOU00012e19@hotmail.com>; from hernandoo@hotmail.com on Mon, Jun 18, 2001 at 03:57:30PM -0000
List-ID: <linux-parisc.vger.kernel.org>

Hernando Orozco said:
> I've downloaded the 32bit Install ISO (STI), but it is .gz. (zip file). I'm 
> working on windows and I want to know what should I do to create the cd 
> image. The recording program is Easy Cd Creator.
> I've tryed to uncompress the file with winzip, but it brings up an error.
> What should I do ?

A bit off-topic, but hopefully this will set you straight:

If you've downloaded it correctly (ie the file is intact, and not
transferred in ASCII mode or some other silly mistake) then WinZip
_should_ be able to open the .gz file.  (gz is gzip, not zip.)

Around and about the place one can find useful tools like gzip.exe (gzip
for DOS/Win32) and md5sum.exe (md5sum program).  The md5sum program can
be found on any Debian FTP mirror site in the "tools" directory.  You
can use that to compare the md5 checksum of the iso.gz file against the
ones on the master site.  If you find a gzip.exe you can test the file
directly with 'gzip -tv file.iso.gz' - if it comes up with anything
other than 'OK' then you'll need to download the file again.

Once you have a valid .gz file and have extracted the .iso file, you
can then burn it to CD with pretty much any CDR software, as the file is
a standard ISO9660 image.

Andrew.

--
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
