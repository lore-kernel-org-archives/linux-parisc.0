Received: from mail.w13.tutanota.de (mail.w13.tutanota.de [185.205.69.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD44F30D3F8
	for <linux-parisc@vger.kernel.org>; Sat,  8 Aug 2026 14:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786197738; cv=none; b=RQha7fi1zyKC9FTZBHyD+cklMGqZDr/iV4Rz+GDA0A5/ZK239ZK8h2JGewneIzLPi7EHJb9tfgE51p7S4qLdmdQThWTDryBD25M1QzabTsG29jCMF+7Ue3olAK3NpKI3AIVAJmrap+XE7j1MWKcq5JlnJduy6SxLmJdnp63PYd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786197738; c=relaxed/simple;
	bh=C7y1GugFFPMwZ4GUI5pYT4M3FHjvxj5+/Jnui53CdkA=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=dDILU6mVBgkocIoxPqwNPWfcDVGKSzhJHJDJtxixS7LphOjIOXDAktbs+1LqAGo3z5IVPHgzf4yAp+Qtu25AynBf3UbQ8Y5vQH9kdECA8KaS2i6Iuwn6BmOMZ7uB1eXrf2NX3I7C6WStRtis3JbsJS5SukLMkRGqEJ9Q/PArDfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tutamail.com; spf=pass smtp.mailfrom=tutamail.com; dkim=pass (2048-bit key) header.d=tutamail.com header.i=@tutamail.com header.b=QKMdXIns; arc=none smtp.client-ip=185.205.69.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tutamail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tutamail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tutamail.com header.i=@tutamail.com header.b="QKMdXIns"
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w13.tutanota.de (Postfix) with ESMTP id DBC4816BAFC4E
	for <linux-parisc@vger.kernel.org>; Sat,  8 Aug 2026 16:02:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786197734;
	s=s1; d=tutamail.com;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
	bh=C7y1GugFFPMwZ4GUI5pYT4M3FHjvxj5+/Jnui53CdkA=;
	b=QKMdXInsSeQ1/VuBgusY58YagUrSpu2GQB7QDiaveRQ9K2bRwZE3Mac8t9R/jIk9
	J9hxtqJzmNE9vVFdzbS56mNNSGH/1nB2ttQwYAyyxCAzSLOqRLhUhCXHLEIMIHAKq8m
	ePYKUbEDa0wckYBN0Dlm6wg6Tzd7Af+taDsPn9V2anm0lUMpE48GvtIMpxIhBxFQ12P
	n+c7ru4Bag5/jP98Z2dMoTW2z/HesLujtczcAFRaddOGgMccfnOZhH6pqvui5sXyurj
	pqBItIrthmXDMtzhTAQgu+zSWkR3vMKUinJYDogDoX0lqTjdsBNgsd3/goxX+MyWEkU
	DAX9iGof9g==
Date: Sat, 8 Aug 2026 16:02:14 +0200 (CEST)
From: jeandelu@tutamail.com
To: Linux Kernel <linux-kernel@vger.kernel.org>
Cc: Linux Parisc <linux-parisc@vger.kernel.org>, Deller <deller@gmx.de>
Message-ID: <OzWfYcD--F-9@tutamail.com>
Subject: [PATCH] parisc: eisa_enumerator: Fix out-of-bounds reads of the
 EEPROM buffer
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Feedback-ID: 01bfe2e9a259758e078407f094ebc3bbb2e1513fb186042e213a2c6176434551ca0ee11b0bb29c681ff93aaf63d3663834addf1018acef21144d33c246b274d759:TurnOnPrivacy!:tutamail

From: jean delu <jeandelu@tutamail.com>
Date: Sat, 8 Aug 2026 16:00:00 +0200
Subject: [PATCH] parisc: eisa_enumerator: Fix out-of-bounds reads of the EE=
PROM buffer

eisa_enumerator() trusts the contents of the EISA EEPROM.=C2=A0 The number
of slots is read from the EEPROM header and used to access the slot
records at HPEE_SLOT_INFO(i) =3D 20 + 48*i within the fixed-size
eeprom_buf (HPEE_MAX_LENGTH, 8192 bytes) without any bound check.=C2=A0 As
struct eeprom_eisa_slot_info is 48 bytes, only 170 records fit into the
buffer, but num_slots is a u8 and may be up to 255, so a corrupted
EEPROM makes the code read up to about 4 kB past the end of the buffer
(e.g. record 254 is accessed at offset 20 + 48*254 =3D 12212).

parse_slot_config() has the same kind of problem: it clamps
config_data_length against HPEE_MAX_LENGTH but does not take
config_data_offset into account, so the parser can walk past the end of
the buffer even when the offset itself is valid.

Clamp the number of slots so that all slot records fit into the buffer,
and hand the number of bytes actually available to parse_slot_config()
and bound the parse by it.

Signed-off-by: jean delu <jeandelu@tutamail.com>
---
drivers/parisc/eisa_enumerator.c | 9 ++++++++-
1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/parisc/eisa_enumerator.c b/drivers/parisc/eisa_enumera=
tor.c
index e0a57086a..f6014258e 100644
--- a/drivers/parisc/eisa_enumerator.c
+++ b/drivers/parisc/eisa_enumerator.c
@@ -311,6 +311,7 @@ static int configure_function(const unsigned char *buf,=
 int *more)
=C2=A0
static int parse_slot_config(int slot,
=C2=A0=C2=A0=C2=A0 const unsigned char *buf,
+=09=09=09=C2=A0=C2=A0=C2=A0 unsigned int buflen,
=C2=A0=C2=A0=C2=A0 struct eeprom_eisa_slot_info *es,=C2=A0
=C2=A0=C2=A0=C2=A0 struct resource *io_parent,
=C2=A0=C2=A0=C2=A0 struct resource *mem_parent)
@@ -333,8 +334,8 @@ static int parse_slot_config(int slot,
printk(KERN_INFO "EISA slot %d: %s %s ",=C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 slot, board, es->flags&HPEE_FLAG_BOARD_IS_IS=
A ? "ISA" : "EISA");

-=09maxlen =3D es->config_data_length < HPEE_MAX_LENGTH ?
-=09=09=09es->config_data_length : HPEE_MAX_LENGTH;
+=09/* never parse beyond the data that is actually in the buffer */
+=09maxlen =3D min_t(unsigned int, es->config_data_length, buflen);
while ((pos < maxlen) && (num_func <=3D es->num_functions)) {
pos+=3Dconfigure_function(buf+pos, &function_len);=C2=A0

@@ -491,6 +492,13 @@ int eisa_enumerator(unsigned long eeprom_addr,
printk(KERN_INFO "Enumerating EISA bus\n");
=C2=A0=C2=A0
eh =3D (struct eeprom_header*)(eeprom_buf);
+=09/*
+=09* The EEPROM contents are not to be trusted: clamp the number of
+=09* slots so that all slot records fit into eeprom_buf.
+=09*/
+=09eh->num_slots =3D min_t(u8, eh->num_slots,
+=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 (HPEE_MAX_LENGTH - sizeof(*eh)) /
+=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(struct eeprom_eisa_slot_info));
for (i=3D0;i<eh->num_slots;i++) {
struct eeprom_eisa_slot_info *es;

@@ -503,6 +511,7 @@ int eisa_enumerator(unsigned long eeprom_addr,

if (es->config_data_offset < HPEE_MAX_LENGTH) {
if (parse_slot_config(i+1, &eeprom_buf[es->config_data_offset],
+=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 HPEE_MAX_LENGTH - es->config_data_=
offset,
=C2=A0=C2=A0=C2=A0=C2=A0 es, io_parent, mem_parent)) {
return -1;
}
--=C2=A0
2.43.0
