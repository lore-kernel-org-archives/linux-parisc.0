From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: [PATCH AUTOSEL for 4.15 118/124] signal/parisc: Document a conflict with SI_USER with SIGFPE
Date: Wed, 21 Mar 2018 14:49:25 -0500
Message-ID: <87370txl8a.fsf@xmission.com>
References: <20180319154645.11350-1-alexander.levin@microsoft.com>
        <20180319154645.11350-118-alexander.levin@microsoft.com>
        <87zi327ozu.fsf@xmission.com>
        <20180321181842.rhniantbvz25bu2f@sasha-lappy>
Mime-Version: 1.0
Content-Type: text/plain
Cc: "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "stable\@vger.kernel.org" <stable@vger.kernel.org>,
        "James E.J. Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>,
        "linux-parisc\@vger.kernel.org" <linux-parisc@vger.kernel.org>
To: Sasha Levin <Alexander.Levin@microsoft.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180321181842.rhniantbvz25bu2f@sasha-lappy> (Sasha Levin's
        message of "Wed, 21 Mar 2018 18:18:44 +0000")
List-ID: <linux-parisc.vger.kernel.org>

Sasha Levin <Alexander.Levin@microsoft.com> writes:

> Hey Eric,
>
> On Tue, Mar 20, 2018 at 10:20:21AM -0500, Eric W. Biederman wrote:
>>Sasha Levin <Alexander.Levin@microsoft.com> writes:
>>
>>What is the justification for backporting this and the other similar
>>Documentation commits?
>
> It was flagged as a bug fixing patch by a new process we're testing, and
> when I looked at it I thought that the commit message suggests it fixes
> an ABI issue.

Unfortunately they just reveal an ABI issue.  I believe there are some
fixes coming but given that the issues are a decade old in many cases
actually fixing these things must be approach with care so as not to
create regressions.

>>These commits just introduce a define _FIXME with value of 0, to
>>document that the userspace ABI was handled incorrectly long ago.
>>
>>These commits do not fix anything.  Thes commits do not change anything
>>except a little how they are handled in siginfo_layout.  And I don't see
>>the changes that introduce siginfo_layout in kernel/signal.c being
>>backported.
>>
>>Further these commits don't even have a fixes tag so I am curious
>>what is triggering them for backport.
>
> We're testing out a new mechanism where we train a neural network to
> detect bug fixing patches and flag them for manual review. We're working
> on a FAQ + more detailed information right now.

The neural network did seem to pick up on something that is worth
looking at.

Eric
