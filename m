Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8273048A7
	for <parisc-linux@lists.parisc-linux.org>; Tue, 26 Aug 2003 00:45:12 -0600 (MDT)
Date: Tue, 26 Aug 2003 08:45:00 +0200
Message-ID: <3F2A5B0400005B6F@ocpmta1.freegates.net>
In-Reply-To: <20030825195042.GA1468@dsl2.external.hp.com>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] CD Not Mounted
To: "Grant Grundler" <grundler@parisc-linux.org>,
	mmogenius@v8fiesta.co.uk
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

> 
>> 
>> On Mon, Aug 25, 2003 at 08:38:34PM +0100, mmogenius@v8fiesta.co.uk wrote:
>> I have a hp visualise b2000 and i am using debian 3.0 (woody)
>
>ok. This sounds like a known problem with the Debian 3.0r0
>install CDs. Did a Debian 3.0r1 installer ever get made?
>
You have right, the pb is well known and afaik not yet resolved: it seems
that pdc console and ide cdrom are not compatible (so have to install via
net-install or an external scsi drive if you have an additional scsi card.
then build your own kernel to access ide-cdrom). The system boot but early
hang on cd initialisation (the green led lighted continiously)

Excepted this detail, the b2k is a very interesting model with cpu PA8600
400Mhz :) and run kernel as well 32bits as 64bits :)) 

hth,
    Joel


-------------------------------------------------------------------------
Tiscali ADSL, seulement 35 eur/mois et le modem est inclus...abonnez-vous!
http://reg.tiscali.be/default.asp?lg=fr 
