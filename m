From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] [PATCH] Fix HIL Mouse driver for 2.6
Date: Thu, 26 Aug 2004 09:07:25 +0200
Message-ID: <200408260907.25716.deller@gmx.de>
References: <20040826045414.GA3510@ntlworld.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040826045414.GA3510@ntlworld.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Stuart,

I've applied both patches you sent to the parisc linux CVS tree.

Thanks a lot,
Helge

PS: I didn't tested them yet, but will try to do so later today....

On Thursday 26 August 2004 06:54, Stuart Brady wrote:
> This patch makes the HIL pointer driver work in 2.6.  I have tested
> it with both gpm and xfree86.
> 
> IIUC, users of PS/2 mice with HIL hubs should use the psmouse driver
> (CONFIG_MOUSE_PS2) instead.  CONFIG_MOUSE_HIL is not needed for this.
> 
> The hil_ptr driver is for genuine HIL mice.  To compile it you need
> CONFIG_MOUSE_HIL.  CONFIG_MOUSE_PS2 is not needed for HIL mice.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
