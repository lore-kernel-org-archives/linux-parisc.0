Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 23E65482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 30 Jul 2002 15:06:18 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17ZeC3-00019q-00; Tue, 30 Jul 2002 22:06:11 +0100
Date: Tue, 30 Jul 2002 22:06:11 +0100
From: Matthew Wilcox <willy@debian.org>
To: Sue Ludwig <sue_ludwig@hp.com>
Cc: parisc-linux@lists.parisc-linux.org,
	linker-info@thepuffingroup.com,
	"Sue Ludwig (E-mail)" <shl@cup.hp.com>
Subject: Re: [parisc-linux] SOM linker on Linux/ia32, Linux/PARISC targeting HPUX/PARISC
Message-ID: <20020730220611.F3317@parcelfarce.linux.theplanet.co.uk>
References: <001501c2380b$6f1ea430$ce60000f@HPPDL632>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <001501c2380b$6f1ea430$ce60000f@HPPDL632>; from sue_ludwig@hp.com on Tue, Jul 30, 2002 at 01:55:26PM -0700
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

On Tue, Jul 30, 2002 at 01:55:26PM -0700, Sue Ludwig wrote:
> I'm looking for a linker that runs on Linux/ia32, Linux/PARISC32, or
> Linux/PARISC64 but targets HPUX/PARISC32 (generates SOM).
>
> I've seen the related emails with the subject line:
> HP open sourcing the SOM linker (Fri., Nov. 19, 1999)
> http://lists.parisc-linux.org/hypermail/parisc-linux/0252.html
> [Semi OT] SOM Linker (Wed., Nov. 15, 2000)
> http://lists.parisc-linux.org/hypermail/parisc-linux/2227.html
> 
> But no information on if such a linker was ever successfully built.
> 
> I've also tried to access the linker source code at:
> ftp://puffin.external.hp.com/pub/parisc/linker
> http://www.thepuffingroup.com/parisc/cvs.html
> but was unable to.  Does anyone know where the PA32 linker source code can
> be accessed?

Wow.  Best of luck!  The parisc-linux kernel was converted from SOM
to ELF about 2 years ago, so nobody's used it recently.  You can see
the source code at http://cvs.parisc-linux.org/obsolete/linker/ If you
follow the instructions on the website, you can check out the sources with
`cvs co obsolete/linker'.

Best of luck, I don't know how easy this is going to be to make work...

Have you considered an alias which copies all the .o files to an hpux
host and runs the linker there?  ;-)

-- 
Revolutions do not require corporate support.
