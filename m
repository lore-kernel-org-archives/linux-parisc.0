From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] kernel module relocation bug
Date: 29 Nov 2004 09:32:11 -0600
Message-ID: <1101742338.1714.8.camel@mulgrave>
References: <20041127064710.GL9148@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041127064710.GL9148@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, 2004-11-27 at 00:47, Randolph Chung wrote:
> currently the kernel module loader does not support long branch stubs.
> using the debian 2.6.8-1 kernel, when loading the ipv6 module, i see:
> 
> legolas[6:43] linux-2.6% sudo modprobe ipv6
> FATAL: Error inserting ipv6 (/lib/modules/2.6.8-1-32-smp/kernel/net/ipv6/ipv6.ko): Invalid module format
> 
> in syslog, i get:
> module ipv6 relocation of symbol fold_prot_inuse is out of range (0x3ffeffe2 in 17 bits)


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
