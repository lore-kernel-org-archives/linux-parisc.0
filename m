From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: Comments?
Date: Sun, 13 Mar 2005 11:21:53 -0500 (EST)
Message-ID: <200503131621.j2DGLrVd029395@hiauly1.hia.nrc.ca>
References: <20050313011921.GB28289@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: randolph@tausq.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050313011921.GB28289@tausq.org> from "Randolph Chung" at Mar
	12, 2005 05:19:21 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I think the attached patch is what we should do; the problem is that we
> are trying to put a 64-bit quantity (loff_t) into an int *, and we end
> up only storing the top bits. (see fs/ioctl.c for details)
> 
> Is this the right thing to do? Do we need something similar for
> get_user()?

Thinking more about this, I've decided that this change would
tend to hide problems.  The reality is that fs/ioctl.c has to
deal with how to convert the loff_t value to an int (e.g., return
INT_MAX for positive offsets exceeding INT_MAX, or return an
error, etc).  Truncation likely isn't the right thing to do
in all cases.

I don't know what is required here as the behavior of FIONREAD
for large offsets isn't defined.  Possibly, the issue is
academic in this case as it may not be possible to have more
than 2 GB of unread queued data.

GCC has a builtin __builtin_types_compatible_p that checks if
two types are compatible.  It might be used in a debug kernel
to look for other similar problems.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
