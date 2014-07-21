From: "Helge Deller" <deller@gmx.de>
Subject: Aw: Re: struct sigaction sa_restorer field
Date: Mon, 21 Jul 2014 17:30:00 +0200
Message-ID: <trinity-4fb37bf0-16a5-4b36-8b42-32178d33ebd0-1405956600688@3capp-gmx-bs02>
References: <BLU436-SMTP205700FFA476092032AE8BA97F30@phx.gbl>
 <trinity-72a99ebc-405d-44c1-8c8b-0a04a9b401b3-1405931146850@3capp-gmx-bs43>,
 <BLU436-SMTP1157331F7463DB56E855A8897F00@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: "linux-parisc List" <linux-parisc@vger.kernel.org>
To: "John David Anglin" <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU436-SMTP1157331F7463DB56E855A8897F00@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> >> The sa_restorer field is obsolete and not in the hppa struct
> >> sigaction, but we still define SA_RESTORER.  What should be done?
> > Basically to not break userspace we can't (and shouldn't) add the sa_restorer struct member.
> > So, the only option would be to drop the SA_RESTORER #define, right?
> > But I have no idea how and if this will break some builds, since the major arches seem to define SA_RESTORER...
> >
> I asked the question when I saw the crashme kernel test package didn't 
> build due to the missing field.
> 
> In the generic sigaction struct, the field is conditional on the 
> SA_RESTORER define.  I imagine that
> the major arches also have sa_restorer struct member.
> 
> I agree it seems best to remove the define.

Ok, then can you send a patch ?
Should we request to backport it into stable kernels? I think so...

Helge
