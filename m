Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 17 Dec 2002 11:19:01 -0700
To: jsoe0708@tiscali.be
Cc: Ed Schaller <schallee@darkmist.net>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] quad tulip now not functional in 2.4.20
Message-ID: <20021217181901.GA2254@dsl2.external.hp.com>
References: <3DED9BBD000021C7@ocpmta7.freegates.net> <3DED9BBD000022D4@ocpmta7.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3DED9BBD000022D4@ocpmta7.freegates.net>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Tue, Dec 17, 2002 at 04:14:10PM +0100, jsoe0708@tiscali.be wrote:
> >I will try to revert tulip driver and advise you.
> Well I find some minutes to do this reverse and it works.
> Still have to find the bug ?

Unfortunately yes.
But since the diff is small, it's alot easier.

I'm most suspicious about the added checks for length field in eeprom.
But I'll review the diff again and tinker with it today or tomorrow.
I added that thinking that code only gets executed when there is no
phy table (eg built-in). But the add-on cards do have a phy table.

grant
