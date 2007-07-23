From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] [PATCH] [PARISC] Clean up syslog output of
Date: Mon, 23 Jul 2007 22:21:06 +0200
Message-ID: <200707232221.06720.deller__13450.3740621314$1416624416$gmane$org@gmx.de>
References: <46A3471D.6030704@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: Joel Soete <soete.joel@scarlet.be>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <46A3471D.6030704@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Joel,

On Sunday 22 July 2007, Joel Soete wrote:
> Just try your patch against latest 2.6.22-pa1 and it seems that:
>   		enum bug_trap_type tt;
> -		tt = report_bug(regs->iaoq[0] & ~3, regs);
> +		tt = report_bug(instruction_pointer(regs), regs);
> should be
> +		tt = report_bug(instruction_pointer(regs));

Why ?
In include/linux/bug.h the function report_bug() is defined as:
	report_bug(unsigned long bug_addr, struct pt_regs *regs)

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
