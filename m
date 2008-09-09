From: Bastian Blank <waldi@debian.org>
Subject: Re: Debian parisc config for 2.6.26 broke the real time clock
Date: Tue, 9 Sep 2008 19:38:37 +0200
Message-ID: <20080909173837.GA1457@wavehammer.waldi.eu.org>
References: <1220713586.3430.14.camel@localhost.localdomain> <20080908163703.GA3218@wavehammer.waldi.eu.org> <1220893102.8074.41.camel@localhost.localdomain> <20080909165835.GB1447@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
To: debian-kernel@lists.debian.org,
	Parisc List <linux-parisc@vger.kernel.org>,
	debian-hppa@lists.debian.org
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <20080909165835.GB1447@colo.lackof.org>
Resent-Message-ID: <iNgYGLsAnsF.A.xSD.rSrxIB@liszt>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On Tue, Sep 09, 2008 at 10:58:35AM -0600, dann frazier wrote:
> fyi, I've got an hppa build in progress - disabling RTC_CLASS causes
> the symbols below to be removed (essentially, ^rtc_*)

The whole new-style rtc support.

> I'm not sure what's behind the hppa/ABI removal commits - I didn't see
> this discussed on the list - but I think it should be safe to remove
> these symbols from the ABI files if we can demonstrate that none of
> the conglomerate packages use them.

Why does noone write this 30 lines module and fix it for all?

Bastian

-- 
Behind every great man, there is a woman -- urging him on.
		-- Harry Mudd, "I, Mudd", stardate 4513.3
