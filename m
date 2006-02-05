From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] long double on hppa64-*-linux*
Date: Sat, 4 Feb 2006 17:45:07 -0700
Message-ID: <20060205004507.GB2225@colo.lackof.org>
References: <200602042341.k14Nf0P9005946@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: carlos@systemhalted.org,
 tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200602042341.k14Nf0P9005946@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Feb 04, 2006 at 06:41:00PM -0500, John David Anglin wrote:
> I noticed another long double issue.  Long double is defined to be 128
> bits on all 64-bit targets on the PA.  I believe that it should be 128 bits
> only on hpux.
> 
> I would like to change the long double default on PA64t o 64 bits as there
> isn't any hardware support for the 128-bit type, and we currently don't
> have software support for 128-bit long doubles implemented.  I can't see
> this affecting anything, but it's another ABI change and I thought I should
> ask.

I'm ok with it. The only downside I can think of is hypothetical:
supporting HPUX binaries with "long double" on parisc-linux hmight get
interesting should any misaligned trap handlers or syscalls need to deal
with long double.

hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
