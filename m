From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [RFC] using 64bit wide registers with 32bit kernel
Date: Sat, 13 May 2006 19:35:48 -0400 (EDT)
Message-ID: <200605132335.k4DNZmAY002050@hiauly1.hia.nrc.ca>
References: <7d01f9f00605131543p1458c0c9l55863d71f1a039d8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: T-Bone@parisc-linux.org (Thibaut VARENE)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00605131543p1458c0c9l55863d71f1a039d8@mail.gmail.com>
	from "Thibaut VARENE" at May 14, 2006 00:43:36 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > I believe that's the correct approach.  The context state needs to
> > be updated for 64-bit userspace anyway.  HP-UX has some horrible
> > macros like GetSSReg for accessing register values in context data
> > (see pa/save_state.h).
> 
> As James pointed out, fixing this means doubling the size of saved
> registers on stack...

I believe that we already save 64 bits when CONFIG_64BIT is true.  See
assembly.h.

> There I'm a bit confused. Correct me if I'm wrong, but to be able to
> effectively use 64bit registers you need the kernel to save 64bit
> registers on context switch? So if the narrow kernel doesn't support
> 64bit context information (as it's currently the case with
> parisc-linux), you can't use them?

64-bit kernels run in wide mode, so they have to save/restore 64bit
registers.  It's certainly not much of an extension to save 64 bits
on user context changes.

> Are you trying to say that userspace code shouldn't be using the full
> registers width when running a 32bit (narrow) kernel?

I don't believe that it's impossible to support the full register width
with a 32bit (narrow) kernel.  However, hpux to my knowledge doesn't
support 64-bit registers when using a narrow kernel.  I think this
reflects the historical development of hpux.  The first PA 2.0 kernels
were narrow and based on the 32-bit PA 1.1 implementation.  Wide kernels
were introduced with HP-UX 11.

> If so, how can hpux support using 64bit registers in non wide mode?
> Upon any context switch, their content would be messed up if only half
> of it is saved...

Sure.  The hpux context has various flag bits (e.g. SS_WIDEREGS
and SS_NARROWISINVALID) to handle the various differences between
the PA 1.0, 1.1 and 2.0 architectures.  There was a change in
the number of floating point registers between 1.0 and 1.1, and
in the accessibility of the left and right halves.

Personally, I think the wide register support is most important
when running a 64-bit kernel and that's the place it would be
easiest to implement.  I can see that there are situations where
it would be nice to use 64-bit registers on a narrow kernel but
this would change the size of register files, the context passed
to signal handlers, etc.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
