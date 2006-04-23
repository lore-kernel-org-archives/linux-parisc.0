From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] Does it lakes some cloberred r1 in
Date: Sun, 23 Apr 2006 12:06:53 -0500
Message-ID: <200604231206.53217.mszick@morethan.org>
References: <200604221648.k3MGm2MW010955@hiauly1.hia.nrc.ca>
	<200604231118.51833.mszick@morethan.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604231118.51833.mszick@morethan.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun April 23 2006 11:18, Michael S. Zick wrote:
> 
> Next question.
> 
My bad, that was just plain rude.

The question and the answer:

Multiple processor pa-risc systems with per-processor
caches use a 'cache coherency' trigger.

To trip the trigger (I.E: make the changes observable)

ldcw,co target_address

Where target_address includes the magic byte[0] of 
the cache line.

Translation:

Spin on the ldcw,co not the ldw here.

On the systems with 128 byte long cache lines,
ensure these spinlocks are 128 byte aligned not
64 byte aligned as in this dump.

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
