From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] J5600 Video
Date: Wed, 7 Feb 2007 16:47:50 -0500
Message-ID: <20070207214750.GA27652__21838.3145089776$1416624277$gmane$org@athena.road.mcmartin.ca>
References: <45CA42F4.2070207@cox.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: debian-glibc@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
To: Michael Greene <listsnews@cox.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <45CA42F4.2070207@cox.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Feb 07, 2007 at 04:21:56PM -0500, Michael Greene wrote:
> I have my old J5600 recompiled and running with 2.6.19.1 kernel. I put 
> an old Voodoo3 2000 rev 1 in the secondary pci slot and it is recognized 
> by the system (not compiled in the kernel just lspci).  Is there any 
> trick to getting it to work with linux in the J5600 before I waste time 
> trying?
> 

I haven't the foggiest clue why you thought debian-glibc would care...

It should be a simple matter of turning on the 3dfx voodoo framebuffer
driver and console on framebuffer support. Point X to use fbdev, instead
of tdfx, which will likely fail spectacularly. Use fbset to change
the framebuffer parameters and make sure your X.org conf matches.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
