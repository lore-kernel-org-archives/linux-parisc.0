Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 18 Dec 2002 10:01:28 -0700
To: jsoe0708@tiscali.be
Cc: Ryan Bradetich <rbradetich@uswest.net>,
	Ed Schaller <schallee@darkmist.net>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] quad tulip now not functional in 2.4.20
Message-ID: <20021218170128.GB17944@dsl2.external.hp.com>
References: <20021217181901.GA2254@dsl2.external.hp.com> <3DED9A6600002207@ocpmta3.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3DED9A6600002207@ocpmta3.freegates.net>
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

On Wed, Dec 18, 2002 at 07:30:40AM +0100, jsoe0708@tiscali.be wrote:
> In eeprom.c I also suspect:
> line 193: if (ee_data[27] == 0 || ee_data[ee_data[27]] == 0) {
...
> and it works. Unforunately I do not have enough doc to actulay fix the pb.

I don't either. I made that change after reviewing the code and just
botched it. My understanding is jgarzik is rewriting tulip driver anyway.

grant
