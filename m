Return-Path: <soete.joel@tiscali.be>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id C58F848CB
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 24 Dec 2003 06:55:19 -0700 (MST)
Message-ID: <3FE99AFB.4070804@tiscali.be>
Date: Wed, 24 Dec 2003 13:56:11 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] DIFF 2.6.0-test10 SATA dma_address
References: <20031124072929.GC26585@colo.lackof.org>
In-Reply-To: <20031124072929.GC26585@colo.lackof.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Grant,

Grant Grundler wrote:
> Willy, Alan,
> 
> SATA support attempts to directly reference scattergather.dma_address
> and .dma_length. That's wrong since those are arch specific fields.
> alpha, cris, parisc, ppc64, sparc, and sparc64 won't build SATA.
> 
> SATA code needs to use "sg_dma_address()" and sg_dma_len()" macros
> to reference those fields.
> 
> If this patch looks good, please tell me which forum (linux-scsi?)
> this needs to be posted to.
> 
Hmm I don't see any follow up but i just read in "post-halloween-2.6.txt"
(Reporting bugs. section) that
[snip]
     SCSI      - linux-scsi@vger.kernel.org
[snip]


> Patch appended and also available from:
> 	ftp://ftp.parisc-linux.org/patches/diff-2.6.0-t10-sata
> 
> The code now compiles but I've not yet built a kernel (forgot to
> disable KALLSYMS - toolchain bugs) and don't have the HW to test it. 
> 

hth,
	Joel

PS: Sorry I miss to follow this patch :(
