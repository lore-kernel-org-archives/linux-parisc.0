Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 12 Aug 2003 09:14:28 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] removing warnings from math-emu code
Message-ID: <20030812151428.GC20514@dsl2.external.hp.com>
References: <20030812034244.GC21328@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030812034244.GC21328@tausq.org>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Mon, Aug 11, 2003 at 08:42:44PM -0700, Randolph Chung wrote:
> Would anyone mind if i committed this to cvs? (2.6 only) It
> removes/hides all the warnings from the math-emu directory, since we
> don't plan to fix them... 

I'm pretty sure Paul Bame said it was ok to fix them at this point.
He didn't expect any major changes to our FP EMU support or
the HPUX FP emulation it was derived from.

grant
