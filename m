From: Joel Soete <joel.soete@tiscali.be>
Subject: Re: [parisc-linux] [PATCH] zalon & ncr53c8xx cleanups
Date: Thu, 11 Sep 2003 21:05:30 +0000
Message-ID: <3F60E39A.3040901__43844.7970235304$1416622769$gmane$org@tiscali.be>
References: <20030911181135.GN21596@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: parisc-linux@parisc-linux.org, linux-scsi@vger.kernel.org
To: Matthew Wilcox <willy@debian.org>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030911181135.GN21596@parcelfarce.linux.theplanet.co.uk>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Matthew Wilcox wrote:

>I don't actually have a zalon machine to test these on, but they seem
>right to me, and compile fine.
>
>Some cleanups for ncr53c8xx & zalon:
>
> - Inline zalon.h into zalon.c
> - Rationalise (a little) ncr53c8xx.c's includes
>
I will try to test this last next week on the c110 (which I recover from 
trash) on which I just install debian 3.0r0 cd1 (so still have to update 
to unstable before all)

hth,
    Joel
