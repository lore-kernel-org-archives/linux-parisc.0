From: Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: [PATCH] Don't mlock guardpage if the stack is growing up
Date: Thu, 12 May 2011 11:06:03 +0200
Message-ID: <4DCBA2FB.3040907@redhat.com>
References: <alpine.DEB.2.00.1105082045250.15552@artax.karlin.mff.cuni.cz> <BANLkTikEpaRZK3X4YReeQAwgcv3HAGUwSw@mail.gmail.com> <alpine.DEB.2.00.1105091246550.32299@artax.karlin.mff.cuni.cz> <4DC7D37F.9040308@redhat.com> <20110509224511.GC15227@parisc-linux.org> <BANLkTikz-sGiy2NdzQMPzCWF64cVF-DZ7w@mail.gmail.com> <20110510225659.GE9253@agk-dp.fab.redhat.com> <4DCA4C05.4030803@redhat.com> <BANLkTi=4raxPiRzBH=b44=SLsAujhx2xUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Milan Broz <mbroz@redhat.com>, Alasdair G Kergon <agk@redhat.com>,
	Matthew Wilcox <matthew@wil.cx>,
	Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	Hugh Dickins <hughd@google.com>,
	Oleg Nesterov <oleg@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BANLkTi=4raxPiRzBH=b44=SLsAujhx2xUw@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Dne 12.5.2011 04:12, Linus Torvalds napsal(a):
> On Wed, May 11, 2011 at 1:42 AM, Milan Broz <mbroz@redhat.com> wrote:
>>
>> Another one is cryptsetup [..]
> 
> Quite frankly, all security-related uses should always be happy about
> a "MCL_SPARSE" model, since there is no point in ever bringing in
> pages that haven't been used. The whole (and only) point of
> mlock[all]() for them is the "avoid to push to disk" issue.
> 
> I do wonder if we really should ever do the page-in at all. We might
> simply be better off always just saying "we'll lock pages you've
> touched, that's it".
> 


For LVM we need to ensure the code which might ever be executed during  disk
suspend state must be paged and locked in - thus we would need MCL_SPARSE only
on several selected 'unneeded' libraries - as we are obviously not really able
to select which part of glibc might be needed during all code path (though I
guess we may find some limits).  But if we are sure that some libraries and
locale files will never be used during suspend state - we do not care about
those pages at all.

So it's not like we would always need only MCL_SPARSE all the time - we would
probably need to have some control to switch i.e.  glibc into MCL_ALL.

Zdenek
