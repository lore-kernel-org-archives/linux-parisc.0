Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id EC058482E
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Dec 2002 07:27:38 -0700 (MST)
Subject: Re: [parisc-linux] quad tulip now not functional in 2.4.20
From: Ryan Bradetich <rbradetich@uswest.net>
To: jsoe0708@tiscali.be
Cc: grundler@dsl2.external.hp.com,
	Ed Schaller <schallee@darkmist.net>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <3DED9A6600002207@ocpmta3.freegates.net>
References: <3DED9A6600002207@ocpmta3.freegates.net>
Content-Type: text/plain
Date: 19 Dec 2002 07:27:32 -0700
Message-Id: <1040308053.24208.4.camel@beavis>
Mime-Version: 1.0
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

Joel,

Just a heads up ... I will not even have a chance to look at this for
a week or two.

Thanks,

- Ryan

On Tue, 2002-12-17 at 23:30, jsoe0708@tiscali.be wrote:
> Hi Grant,
> >
> >On Tue, Dec 17, 2002 at 04:14:10PM +0100, jsoe0708@tiscali.be wrote:
> >> >I will try to revert tulip driver and advise you.
> >> Well I find some minutes to do this reverse and it works.
> >> Still have to find the bug ?
> >
> >Unfortunately yes.
> >But since the diff is small, it's alot easier.
> >
> >I'm most suspicious about the added checks for length field in eeprom.
> >But I'll review the diff again and tinker with it today or tomorrow.
> >I added that thinking that code only gets executed when there is no
> >phy table (eg built-in). But the add-on cards do have a phy table.
> >
> (well it seems I do mistake when sent following info)
> [also because diff is small]
> In eeprom.c I also suspect:
> line 193: if (ee_data[27] == 0 || ee_data[ee_data[27]] == 0) {
> 
> which I only reverse into:
> if (ee_data[27] == 0) {
> 
> and it works. Unforunately I do not have enough doc to actulay fix the pb.
> May be Ryan could still help us?
> 
> Joel
> 
> ********************************************************************************
> Controlez mieux votre consommation Internet...surfez Tiscali Complete...http://tiscali.complete.be
> 
> 
> 
> 
