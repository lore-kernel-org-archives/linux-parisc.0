From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] Re: [PATCH] Common compat_sys_sysinfo
Date: Sun, 7 Jan 2007 16:39:31 -0700
Message-ID: <20070107233931.GT24620__1731.05450016937$1416624258$gmane$org@parisc-linux.org>
References: <20070107144850.GB3207@athena.road.mcmartin.ca>
	<20070107151319.GA23478@infradead.org>
	<20070107151817.GN24620@parisc-linux.org>
	<119aab440701071422x2041a7b9lf5361c15a001d954@mail.gmail.com>
	<20070107223130.GR24620@parisc-linux.org>
	<45A181E2.9020609@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <45A181E2.9020609@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jan 08, 2007 at 07:27:30AM +0800, Randolph Chung wrote:
> >>I'm sure this has been proposed by someone else?
> >
> >That seems like the same as my suggestion, except for the spelling
> >(syscall vs packed_args).  Did I miss something?
> 
> If you change this now, wouldn't it break existing binaries? I hope we 
> don't end up with some syscalls using one convention and others using a 
> different convention...

Uh, you asked this on IRC and I answered ...

<tausq> if you changed the syscall abi, wouldn't you break all the
existing binaries?
<kyle> not if we kept the old one...
<tausq> ?
<tausq> then how do you implement what willy is talking about?
<willy> tausq: I'm not talking about changing the syscall ABI
<willy> I'm talking about getting rid of our wrappers for, eg,
parisc_truncate64()

We *already* use the "wrong" ABI in glibc.  That's why we have the
parisc_* syscalls.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
