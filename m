Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id EA0BA4829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Mar 2003 08:07:36 -0700 (MST)
Date: Fri, 21 Mar 2003 16:07:32 +0100
Message-ID: <3E689FC400004E43@ocpmta1.freegates.net>
In-Reply-To: <20030321133624.GK14520@parcelfarce.linux.theplanet.co.uk>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
To: "Matthew Wilcox" <willy@debian.org>
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

>> I test following work-around against 2.4.20-pa32 with latest dpkg gcc-3.3
>> (3.3-0pre2) and it boot well know:
>> @@ -489,7 +489,11 @@
>> +#if !defined (__LP64__) && ((__GNUC__ > 3) || (__GNUC__ == 3 && __GNUC_MINOR__
>> >= 1))
>> +		if (ka->sa.sa_handler == (void *)SIG_IGN) {
>> +#else
>>  		if (ka->sa.sa_handler == SIG_IGN) {
>> +#endif
>
>ugh, this is foolish.  You should be doing:
>
>-		if (ka->sa.sa_handler == SIG_IGN) {
>+		if (ka->sa.sa_handler == (void *)SIG_IGN) {
>
>no ifdefs!
>
Willy, I trust you (not me because I not tested with gcc-3.2 neither LP64)

Thanks for your attention,
    Joel

PS: Next time I will try to pay attention to cc list :)

---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
