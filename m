From: Kyle McMartin <kyle@parisc-linux.org>
Subject: Re: [parisc-linux] Debugging 64-bit kernel crashes involving
Date: Thu, 8 Mar 2007 14:31:20 -0500
Message-ID: <20070308193119.GA3553__11430.3342103542$1416624323$gmane$org@athena.road.mcmartin.ca>
References: <200702240039.l1O0dCxG017471@hiauly1.hia.nrc.ca>
	<1172277920.3424.83.camel@mulgrave.il.steeleye.com>
	<119aab440702251819u1a070512j2cb8ca2eeadf0962@mail.gmail.com>
	<1172461983.3423.34.camel@mulgrave.il.steeleye.com>
	<1172467172.3423.39.camel@mulgrave.il.steeleye.com>
	<1172620930.3408.46.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1172620930.3408.46.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Feb 27, 2007 at 06:02:10PM -0600, James Bottomley wrote:
> +	/* need to be executing in user context */
> +	if (regs->iasq[0] != 0 || regs->iasq[1] != 0) {

Is there a reason we can't use user_space() from ptrace.h here? You may have
just spotted a subtle bug elsewhere since user_space only checks iasq[1]...
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
