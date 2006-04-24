From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Does it lakes some cloberred r1 in
Date: Mon, 24 Apr 2006 15:15:02 -0400 (EDT)
Message-ID: <200604241915.k3OJF2C2028663@hiauly1.hia.nrc.ca>
References: <200604241300.13265.mszick@morethan.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: mszick@morethan.org (Michael S. Zick)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604241300.13265.mszick@morethan.org> from "Michael S. Zick"
	at Apr 24, 2006 01:00:13 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Right, notice that it was at the request of HP-UX group for non-I/O
> devices.
> 
> Think of it this way:
> 
> ldcw, co Cache_Line[0]
> 
> The hardware, system wide, exclusive lock for this cache line.
> 
> A cache line is a big place...
> 
> ldcw, co Cache_Line[4 .. max-4]
> 
> This cpu now owns the cache line, so the other cpus do not need
> to be updated, nor the cache coherency bandwidth burned up...
> The non-zero cache line offset does this trick.

Ok, I understand.  I don't think that there is anything special
regarding Cache_Line[0].  You just need 4 bytes for the system-wide
lock.  Then, you can use the rest for semaphores on the cpu that
grabbed the system-wide lock.

Don't know if this trick would be useful for linux or not.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
