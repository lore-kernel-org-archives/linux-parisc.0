Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id E48694A82
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 14 Apr 2004 10:36:03 -0600 (MDT)
Date: Wed, 14 Apr 2004 18:26:21 +0200
Message-ID: <40711E5500005FC3@ocpmta2.freegates.net>
In-Reply-To: <1081954200.10872.10.camel@mulgrave>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 2.6.5-rc2-pa2 boot panic on c110 :(
To: "James Bottomley" <James.Bottomley@steeleye.com>,
	"Ryan Bradetich" <rbradetich@uswest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: Grant Grundler <grundler@parisc-linux.org>,
	PA-RISC Linux Port <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hello James,

>> On Wed, 2004-04-14 at 09:36, Ryan Bradetich wrote:
>> Ah .. I was under the impression it was a boot problem.  I will perform
>> the find, fsck and tar tests tests ... I only have a small disk (~500MB)
>> in the system so i will probably need to setup 
>> ome external disks.  I
>> will try the tests w/o using software raid first, then add in the
>> software raid as a an additional variable.  This may take me a couple
of
>> days to get this accomplished (busy work schedule :().
>
>It was (hence 'boot panic' in the title):
>
>http://lists.parisc-linux.org/pipermail/parisc-linux/2004-March/022657.html

You have absolutly right, please apologies. My wory was to follow up a single
thread: bad idea to not modify the title :(

>So, Joel, are you saying you no-longer see this boot panic problem?

Yes not anymore this panic :)

(sometime, the system still panic but far later, after a fsck or a md sync
[sorry I don't remember with enough acuracy]).

Thanks,
   Joel

----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr
