Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1F44D482D
	for <parisc-linux@lists.parisc-linux.org>; Fri, 29 Aug 2003 10:00:01 -0600 (MDT)
Date: Fri, 29 Aug 2003 17:59:53 +0200
Message-ID: <3F4D78B0000005EE@ocpmta3.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: RE: [parisc-linux] Re: [parisc-linux-cvs] linux carlos
To: "Jim Hull" <jim.hull@hp.com>, parisc-linux@lists.parisc-linux.org
Cc: "Grant Grundler" <grundler@parisc-linux.org>
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

>If you use fdc, fic, or pdc then they are broadcast to other
>processors, but fdce and fice are not.

Hi Jim and al,

I just noticed the two following loops:
flush_data_cache_local:
[...]

fdmanyloop:                                     /* Loop if LOOP >= 2 */
        ADDIB>          -1,%r31,fdmanyloop      /* Adjusted inner loop decr
*/
        fdce            0(%sr1,%arg0)
        fdce,m          %arg1(%sr1,%arg0)       /* Last fdce and addr adjust
*/
        movb,tr         %arg3,%r31,fdmanyloop   /* Re-init inner loop count
*/
        ADDIB<=,n       -1,%arg2,fdsync         /* Outer loop decr */

fdoneloop:                                      /* Loop if LOOP = 1 */
        ADDIB>          -1,%arg2,fdoneloop      /* Outer loop count decr
*/
        fdce,m          %arg1(%sr1,%arg0)       /* Fdce for one loop */

fdsync:
        syncdma
        sync
        mtsm    %r22
        bv      %r0(%r2)
        nop
        .exit

        .procend

[...]

flush_instruction_cache_local:
[...]

fimanyloop:                                     /* Loop if LOOP >= 2 */
        ADDIB>          -1,%r31,fimanyloop      /* Adjusted inner loop decr
*/
        fice            0(%sr1,%arg0)
        fice,m          %arg1(%sr1,%arg0)       /* Last fice and addr adjust
*/
        movb,tr         %arg3,%r31,fimanyloop   /* Re-init inner loop count
*/
        ADDIB<=,n       -1,%arg2,fisync         /* Outer loop decr */

fioneloop:                                      /* Loop if LOOP = 1 */
        ADDIB>          -1,%arg2,fioneloop      /* Outer loop count decr
*/
        fice,m          %arg1(%sr1,%arg0)       /* Fice for one loop */

fisync:
        sync
        bv      %r0(%r2)
        nop
        .exit

        .procend


Do you think that could be there where the pb occurs?

Thanks for advise,
    Joel

-------------------------------------------------------------------------
Tiscali ADSL, seulement 35 eur/mois et le modem est inclus...abonnez-vous!
http://reg.tiscali.be/default.asp?lg=fr 
