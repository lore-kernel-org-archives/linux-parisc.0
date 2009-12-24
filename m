From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: futex wait failure
Date: Wed, 23 Dec 2009 21:22:47 -0500
Message-ID: <119aab440912231822m4b2a9c30ja5e17404210e7e50@mail.gmail.com>
References: <20091223221856.3E76F4E77@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091223221856.3E76F4E77@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Dec 23, 2009 at 5:18 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> I have noticed that the notifierMutex mutex is initialized to all
>> zeros (i.e., it's declared static). =A0Is this ok with our nptl impl=
ementation?
>
> Forget this, it's done in Tcl_MutexLock.

In NPTL the hppa locks are all zero. We no longer use
load-and-clear-word for anything in userspace.

Even the dynamic initialization will zero the lock.

We are just like every other architecture... with the exception that
we currently have more bugs :-)

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
