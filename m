Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA32437
	for <parisc-linux@puffin.external.hp.com>; Fri, 8 Dec 2000 20:10:17 -0700
Message-Id: <200012090312.WAA00684@hiauly1.hia.nrc.ca>
Subject: Re: pa reload problem
To: rth@redhat.com (Richard Henderson)
Date: Fri, 8 Dec 2000 22:12:43 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: alan@linuxcare.com.au, law@cygnus.com, rhirst@linuxcare.com,
        parisc-linux@thepuffingroup.com, gcc-bugs@gcc.gnu.org
In-Reply-To: <20001208173948.B4198@redhat.com> from "Richard Henderson" at Dec 8, 2000 05:39:48 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> 
> On Fri, Dec 08, 2000 at 08:07:23PM -0500, John David Anglin wrote:
> > It is my impression that the MEM would pass as a general_operand unless
> > the volatile flag is set.  It will pass GO_IF_LEGITIMATE_ADDRESS.  Thus,
> > the general_operand test doesn't look like it will work.
> 
> Your GO_IF_LEGITIMATE_ADDRESS will accept the UNSPEC?
> The mind boggles.  Why, then, is this strange beast its own insn?

Sure looks like it:

#define GO_IF_LEGITIMATE_ADDRESS(MODE, X, ADDR)  \ 
[snip]
  /* Needed for -fPIC */                                \
  else if (GET_CODE (X) == LO_SUM                       \
           && GET_CODE (XEXP (X, 0)) == REG             \
           && REG_OK_FOR_BASE_P (XEXP (X, 0))           \
           && GET_CODE (XEXP (X, 1)) == UNSPEC)         \
    goto ADDR;                                          \
}

The comment for the insn used to load a PIC MEM says:

; We need this to make sure CSE doesn't simplify a memory load with a
; symbolic address, whose content it think it knows.  For PIC, what CSE
; think is the real value will be the address of that value.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
