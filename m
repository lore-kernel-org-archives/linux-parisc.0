From: bame@ldl.fc.hp.com (Paul Bame)
Subject: Re: [parisc-linux] palo_1.5 available
Date: Tue, 18 May 2004 12:29:56 -0600
Message-ID: <20040518182956.GA15743@ldl.fc.hp.com>
References: <20040514223526.GA8018@ldl.fc.hp.com> <40A6A4C9.5090201@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <40A6A4C9.5090201@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, May 15, 2004 at 11:16:25PM +0000, Joel Soete wrote:
> Thanks but I would just remember that the original idea was of Bjoern A. 
> Zeeb :)

palo 1.6 will have a more accurate comment in the changelot

> workaround) but still lock when with my large finger I typo and:
> Command line for kernel: 'root=/dev/md2 HOME=/ console=ttyS0 TERM=vt102 
> palo_kernel=3/vmlinux-2.66-rc3'
> Selected kernel: /vmlinux-2.66-rc3-pa3 from partition 3
> ERROR: open /vmlinux-2.66-rc3-pa3 from partition 3 failed

Thanks for spotting those cases I missed.  They'll be caught in 1.6

	-P
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
