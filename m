Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id ABB8F482D
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Jun 2003 11:48:10 -0600 (MDT)
Message-Id: <200306191748.h5JHm8lY022592@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: g++ (3.3): ...Error: Field out of range
To: jsoe0708@tiscali.be (Joel Soete)
Date: Thu, 19 Jun 2003 13:48:08 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3ED70CF100007B7A@ocpmta2.freegates.net> from "Joel Soete" at Jun 19, 2003 07:27:25 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> Ah, in fact I well read it also but do not figure out because of man comment:
> "max-inline-insns
>     If an function contains more than this many instructions, it
>     will not be inlined.  This option is precisely equivalent to
>     -finline-limit.
> "
> 
> Anyway, I try 300, 200, 100 and stop at 50 without any more success :-(
> (I can still try lower?)

Actually, I see that the `val' from -finline-limit sets the parameters
as follows in 3.4:

      set_param_value ("max-inline-insns", val);
      set_param_value ("max-inline-insns-single", val/2);
      set_param_value ("max-inline-insns-auto", val/2);
      set_param_value ("max-inline-insns-rtl", val);
      if (val/4 < MIN_INLINE_INSNS)
	{
	  if (val/4 > 10)
	    set_param_value ("min-inline-insns", val/4);
	  else
	    set_param_value ("min-inline-insns", 10);
	}

You might also try -fno-default-inline and -fno-inline, but it's
looking as if inlining isn't the driving factor in the size of
the routine.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
