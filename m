From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: [parisc-linux] K410 SCSI 53c700 issue with PLEXTOR PX-R820T
Date: Thu, 16 Nov 2006 00:49:36 +0100
Message-ID: <20061116004936.cd0b52ff.gmsoft@tuxicoman.be>
References: <20061112160350.8b7d4afd.gmsoft@tuxicoman.be>
	<20061112191436.GY16952@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061112191436.GY16952@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 12 Nov 2006 12:14:37 -0700
Matthew Wilcox <matthew@wil.cx> wrote:

> > Please have a look at it and let me know if you need any other info.
> 
> Presumably at some point in 2.6, this device worked fine.  Any chance
> you could bisect and figure out when it started failing?  I'd start with
> looking at something in the 2.6.8 sort of timeframe.


I've tried from kernels since 2.6.8 and it looks like it breaks since 2.6.18.

The dmesg of the last working kernel is here :
https://www.tuxicoman.be/temp/dmesg-2.6.17-53c700

The dmesg of the non working one is here :
https://www.tuxicoman.be/temp/dmesg-2.6-53c700


According 2.6.18's changelog, it looks like a few fixes were merged in this release.

As usual, if you need any other info or even access to this box, let me know.

Cheers,
  Guy
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
