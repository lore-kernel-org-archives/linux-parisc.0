From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Does it lakes some cloberred r1 in
Date: Mon, 24 Apr 2006 11:35:48 -0400 (EDT)
Message-ID: <200604241535.k3OFZmPJ027261@hiauly1.hia.nrc.ca>
References: <200604231206.53217.mszick@morethan.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: mszick@morethan.org (Michael S. Zick)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604231206.53217.mszick@morethan.org> from "Michael S. Zick"
	at Apr 23, 2006 12:06:53 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> ldcw,co target_address
> 
> Where target_address includes the magic byte[0] of 
> the cache line.

Where is this documented?

> Translation:
> 
> Spin on the ldcw,co not the ldw here.

I believe this makes sense as the errata specifies that the ldcw,co
operation has to be performed in cache on PA 2.0 machines:
http://h21007.www2.hp.com/dspp/tech/tech_TechDocumentDetailPage_IDX/1,1701,5310,00.html

> On the systems with 128 byte long cache lines,
> ensure these spinlocks are 128 byte aligned not
> 64 byte aligned as in this dump.

As a practical note, this is very difficult to achieve for dynamically
allocated spinlocks.

The intent of the errata seems to be to relax the alignment requirement
for ldc[dw],co in cases where the spinlock is not being shared with a
non-coherent I/O device.  If spinlocks have to be aligned to the start
of a cacheline, there doesn't seem to be any point to the errata.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
