From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: HPMC bus timeout on C3600
Date: Fri, 2 Jan 2009 21:46:44 +0100
Message-ID: <20090102214644.1d3a7364@tuxicoman.be>
References: <20081220133915.4c167e09@bleh.bxl.tuxicoman.be>
	<20081220221653.GA12880@bombadil.infradead.org>
	<20081220222100.GB12880@bombadil.infradead.org>
	<20081221081206.GC2047@colo.lackof.org>
	<20081222224023.2488f2ef@tuxicoman.be>
	<20081222214743.GC30144@bombadil.infradead.org>
	<20081222234948.776edb1b@tuxicoman.be>
	<20081225080606.GA11032@colo.lackof.org>
	<20081225165750.29c5974c@bleh.bxl.tuxicoman.be>
	<20081225213625.GA7716@colo.lackof.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/_ZGcnk9n_+Q5QwB2+U99uvP"
Cc: Kyle McMartin <kyle@infradead.org>, linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081225213625.GA7716@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--MP_/_ZGcnk9n_+Q5QwB2+U99uvP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, 25 Dec 2008 14:36:25 -0700
Grant Grundler <grundler@parisc-linux.org> wrote:

> > Anything else I can do/provide to troubleshoot this ?
> 
> Two things:
> o consider posting some of the original findings on linux-ide and see
> if anyone has tested this controller on PPC or IA64.  I'm looking for
> any other architecture that has "hard fail" behavior like parisc does.
>   Testing on any other Big Endian HW would be worth hearing about too.
> 
> o write a quick and dirty "hpmc_symbols" script as described above
> and run it on the HPMC you provided earlier.
> 
> Debugging this further wil probably require modifying the sata_sil
> driver to log (e.g. ktrace) it's activities while under test.

Will do, just haven't had time yet.

I quickly looked into why the OS HPMC handler wasn't triggered and the
issue comes from the fact that the length provided to the PDC is
incorrect. The doc states that it should be in bytes while we provide it
in words.

I've attached a small patch that solves this little issue.

Cheers,
  Guy



--MP_/_ZGcnk9n_+Q5QwB2+U99uvP
Content-Type: text/x-patch; name=fix-hpmc-handler-length.diff
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=fix-hpmc-handler-length.diff

OS HPMC handler length needs to be in bytes, not in words.

Signed-off-by: Guy Martin <gmsoft@tuxicoman.be>

--- /root/traps.c.orig	2009-01-02 09:20:41.000000000 +0100
+++ arch/parisc/kernel/traps.c	2009-01-02 09:23:47.000000000 +0100
@@ -840,7 +840,7 @@
 
 	/* Compute Checksum for HPMC handler */
 
-	length = os_hpmc_end - os_hpmc;
+	length = (os_hpmc_end - os_hpmc) * sizeof(u32);
 	ivap[7] = length;
 
 	hpmcp = (u32 *)os_hpmc;

--MP_/_ZGcnk9n_+Q5QwB2+U99uvP--
