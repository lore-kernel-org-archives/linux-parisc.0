From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Re: NETFILTER_DEBUG break b2k 64bits (at least)[Wa
Date: Sat, 08 Jan 2005 15:55:49 +0000
Message-ID: <41E00285.5020302@tiscali.be>
References: <200501080035.j080Z1kK012011@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200501080035.j080Z1kK012011@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



John David Anglin wrote:
[...]
> 
> Note that the hppa64 linker always creates dynamic binaries intended
> to be loaded by a dynamic loader.  It doesn't know how to create a
> fully static binary.  I don't fully understand the ins and outs of
> how this is being handled with 64-bit kernels but I suspect that this
> is why there are duplicates.
> 
My pb is that the only smp system I can test is a N4k model which have afaik a pdc that can only boot a 64bit kernel.
Is there some alternate to boot a 32bit kernel on this kind (A, L, N, ...) system?

Thanks for info,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
