From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] check_ivt panic / binutils
Date: Mon, 2 Oct 2006 20:50:53 -0600
Message-ID: <20061003025052.GR16272@parisc-linux.org>
References: <200610030211.k932BbeR023905@hiauly1.hia.nrc.ca>
	<1159841839.5737.13.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@parisc-linux.org
To: Jeff Bailey <jbailey@raspberryginger.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1159841839.5737.13.camel@localhost.localdomain>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Oct 02, 2006 at 10:17:19PM -0400, Jeff Bailey wrote:
> I'm not claiming I know where the bug is, but I wanted to know what the
> change was that happened between a bootable kernel and a non-bootable
> kernel.

I suppose the obvious thing to do is to objdump -dr each kernel and then
diff the two.  That'll tell you if it's a heisenbug or if there's
actually any difference.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
