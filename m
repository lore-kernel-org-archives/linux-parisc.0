From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] Re: Comments?
Date: Mon, 14 Mar 2005 05:28:42 -0800
Message-ID: <20050314132842.GE28289@tausq.org>
References: <20050313011921.GB28289@tausq.org>
	<200503131621.j2DGLrVd029395@hiauly1.hia.nrc.ca>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503131621.j2DGLrVd029395@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Thinking more about this, I've decided that this change would
> tend to hide problems.  The reality is that fs/ioctl.c has to
> deal with how to convert the loff_t value to an int (e.g., return
> INT_MAX for positive offsets exceeding INT_MAX, or return an
> error, etc).  Truncation likely isn't the right thing to do
> in all cases.

I suppose the behavior should, ideally, match some specification.
Unfortunately the only place I can find where FIONREAD is documented is
in LSB, and the description there is quite value about what the return
type is supposed to be.

For now I've commited a combination of:
1) Change the FIONREAD handling code to explicitly return a 4-byte value
2) Change the put_user code to cast the result to the expected type

Willy says he will follow up with other relevant folks to find out
what's the right thing to do.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
