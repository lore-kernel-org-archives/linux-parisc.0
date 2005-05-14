From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: [parisc-linux] Re: Linux-VServer syscall number for parisc
	(hppa/64) ...
Date: Sun, 15 May 2005 01:27:26 +0200
Message-ID: <20050514232726.GB4507@MAIL.13thfloor.at>
References: <20050506002253.GA27506@MAIL.13thfloor.at>
	<20050506053757.GC25195@colo.lackof.org>
	<20050514230452.GB23641@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050514230452.GB23641@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, May 14, 2005 at 05:04:52PM -0600, Grant Grundler wrote:
> On Thu, May 05, 2005 at 11:37:57PM -0600, Grant Grundler wrote:
> > We are also missing a few other syscalls:
> > 	__NR_sys_kexec_load
> > 	__NR_add_key
> > 	__NR_request_key
> > 	__NR_keyctl
> 
> Herbert,
> I've got a patch ready that adds vserver (263) and the three
> key syscalls. I'm not touching sys_kexec_load since it's arch
> specific and no one has asked for it.
> 
> I checked sparc64 syscall_table.S and it looks like the key syscalls
> do NOT need 32-bit compat wrappers.
> I did NOT audit the key handling code.
> 
> Patch is on
> 	ftp://ftp.parisc-linux.org/patches/diff-2.6.12-rc4-pa4-vserver
> 
> I'll commit this in a bit unless willy or someone else yells.

excellent, thanks a lot!

best,
Herbert

> grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
