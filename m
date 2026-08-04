Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EEF456DE7;
	Tue,  4 Aug 2026 13:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785850197; cv=none; b=ljxHB+i9sRnHkWJVLhKQv9n4I2vWBEqGuvnoe9bSCVp6CYKzfvezkdA8doPpZ8BptPkjUPCWl79ZO4QoRoRVBkTRpvVAwAk7s/UTn6s67sFsJGeE9iy4PHa166H5e0h9kKN2As5Y+RrKBktX6b6aHlQTxk4AT+SgdV34D2PlQq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785850197; c=relaxed/simple;
	bh=MuPI7fjx90Ww8WfqlpZvv2A/vePYOVAbjlB557Vbdpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qeutYSSMWt6/htJbHpZaRTEZ0GgqkMLrRMVvBwCxO4l2I2LejWYtN0A7jfIbeQ0l85ZQwQ9pwMBexWeMs+eajUcA2dQ5wpKdB51qoR9fFYx9LtHYBnwLIcirh279cZqTKP38ar0NgB868KXXovp1E9t8qFsTHdso6V+jQdPOoSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=HMs/f+Zw; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="HMs/f+Zw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1785850192; x=1786454992; i=deller@gmx.de;
	bh=KOySRzRFvuOF4X0Mtr2Xun6VJhy/ZC9Mur068suEpOA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=HMs/f+ZwZmxcrqCuzsaC8b6IwkqFtW3+kSSfeSalQiF7DO5Za+BPN3g2KsLN+P4e
	 uKcSVAgg5ea9oTA62StSN4usu+arbV5NRlWLgO9Ez65f7R1TJqe0eVHU7Pu0b/gxF
	 TzmzJl2HEStlgZlieaR9qVf2FkJXPuRL+7RKZfkJAnCl0bbynVlMBN+l1NomyssYP
	 T00DGHwjoYjUJDA8KBxAHMJ7heChew0Jrr+KZivnRkxkt4v0MJU0ugmhR9Vg3/Dt0
	 edkoWyD6ObKUJjNWewRzXZgDcTTUNn5ipxlehwDR+z4RHEIAQj48FixOUhjlQcu9K
	 fBi8TAw+rE71yE2UvA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8hV5-1wmaNV2Dez-00Fu7U; Tue, 04
 Aug 2026 15:29:52 +0200
Message-ID: <eb470716-e6df-4468-ab23-4902f26a9bac@gmx.de>
Date: Tue, 4 Aug 2026 15:29:51 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] parisc/serial: Use generic BASE_BAUD in asm/serial.h
To: Thorsten Blum <thorsten.blum@linux.dev>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260804132051.104647-4-thorsten.blum@linux.dev>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260804132051.104647-4-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:c7+ilFolPVzSfa4KSwxLPVLY4i7P1bPepviDYbXRgb5dGqO+pZt
 LggyMrABeSkgssmmAjoNGyUHomW6qfux+G4kTrEsuqXFsgKGYHdnekKaQK70kp7vmm3g850
 WrZxBHtn7HyMalH1PGeXkQ4eyLIFAcTXcYCBL3pUyOzEfeTQBWfqTVN6QToV663zTJa+2lN
 VEhaWODeaC+K2kUMKcigQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rtNivD1XLKk=;S1pef2lCSVErHbs6ddgj8YsyBuy
 NqW882pQMuEo3mIxFp3GSQmtMXDGioKRF0ZIyXKcWUaObwSoYp7RMqH5FHrsYZ2s8n0KaSNSx
 w0aRaTfOG0Bcbtd+0g2o6d/VlRr2xLfd4I5QtCbzdFXu5Pi00V74bVw/Q02NSGP9JIhMRMe2c
 gdF0OPC+w9U/q6OfYCLC0vnuo6kPVZMjMPuwMYouNzmXbL6Y75ddTeZOSwLEuPnjLnuLY+9LE
 C1LuRGmbJsPD1Re61ptDz9gd4LKafrjWvJhuNzjh56BrEK+fKWoGPYNknzLfAdJhiuc009YQt
 o0gNFm+YsEvsijNWyIlza/nZFVdZOce01jIkst+PZmc8/bybvibJcoQIgXC3a9TYlMuEEUUyd
 Jz+b3qE97fzMxJaixU4xN7f8LMxcpU7D9fiIUNHgqTEroeXJTQFH2yMBAcgmuWvfhmlSZaW5n
 yzRUVK4uTL8kP5jCBODfuV0CXCsNWC6IxQtzr6DfQR+ghK/L8YlKlLQJpbZzi+rc8X8OkD6dg
 0ZxJLcNTulQg1Pht1yqxP2Fbws/NJKxaFGwurto1FUdkaZ4SoK16H+11m98sgZ8CFjBz+LphW
 I9x4qH2+rLmTR5edriZlx9Im+mlBRHu5GBYQlc+6z4TzPdyge1eyMexjfGnBQhT8alcmBiow5
 v4bn9vaHd3A1ndISmRdmIC/3o9yxCAXMfZkvEbCSzp3NFkobMCJeFFCc7NeHTyC7IP4/orNc/
 PNPgQLtSbiXbVXlD6+7dgAAwLcsrWvv7D2czQ/fJvOJ0sE3mXsNyjdg1wYs/PuI/Rmrjeq+8+
 YhF/UgFSO2+6xPfNQ06baWDGrSFwXM4MudVm07AcKjKmRmJagyVQVCb3rVExQsRCYzt3p2k5Q
 gqogtCPt3GjrcsfpRfBKpL1FzzIV+9VQJToyTyom0m4ifDp0VfgqALlvSzZ3oy/olw4+5Lo0y
 LbPi1xtB1fpYMw7g0NCVVD7lh+xkRg5DtRwNKW9PQRXz55PTuQmlUze02eIpl0+jJyv3OQ/P0
 6b0SZJrRwLaXFSHHpmZ8AvYTMlMsB7pXIzM8l0IUOcZpYmMO507wwI7gSRhxVfvaNIES6XKif
 f0j8OI6tScPqKyQ8le3FnSbqa9Qd1SvO0BYenkFrK9GjHsTGZu938EeUTkisfW8HWarkYz042
 3iHKx8dNlQw+6bGiLq/HiedRud8KokFSJXYz8be0tKTRlAH2Rey6/FqUhFuD3yM+AbbQzb7g0
 Bkt/HvMXmA8CymzBLa+f46dvlK6093OzqaLMa4lucJILzyLXY2wGoVWlId/Dz+MSmBRjqcnwo
 A3h+hbIlkwRnes98jl8WGN+sOz1eL3ywaJCoGfIG+sbhokBpSUCj0UF/v9IBH2L3+9PqJSJFD
 /6A3jnHKcbfiG1f3/xoi4zr6REBXtVMMa13yESV1lL5VB+nvVOIqONK9L0K82ENZ7LNj8opUU
 wpoHIDuIdbeOvJJyz8QIJtVnfLJEz+TEUHdayMlIIuiZ7p+YdN5ZnU+9jQ99LKrrxT28hGB/x
 lrAzBhEDk8XnNuQZVZGhjR0VyOWN+9z1GdcAiniSBcMgNZ/JVTvuYlmzqI0QExgqFe4s3cU/G
 afdYtqIO21ze0vf4d93u6jy+nzf2j1+9eYjJRKUlKx2ZpFPnj+a4tWn32isQMQN/Mn0E6Bn5m
 /0wPxlbd19jlSZQyOOJhFSDA0IiUt95S5XXmlbYrxzm9dbAVu2i0NujKpn89Ssx1MLzqH5k/F
 rD+9rG5YZ+XBkKSUJbzAIdLH/yPMO8W4EGq12mKLskrTRxOpfGOUZv0ffkj+b8k3T39IwrXg0
 0y1+838WaMfo18/RLyT6R5h4pXnvcrZxpelaTtePP6fEadJs28yAVs/pDag+4j8LSWPQ5GzJ1
 fCADo8RL2sqF18GMBsUxJ0MVDmUmz92LbxxQA9bEVI3FdvOKC8CTjkcYa7ozs6RLenMvDN02n
 zyOKu26yN/DWUcPkgnKcBtGw8O1uBBxP9EXFtcZIm0FfRsZTHebV2YC0P8U9Y7kiqOQXo4Y6X
 gKV9xLPzHhsPG2Ch/8Ick9loeaNlhYqLyIYZUXgG5JF5uFw2dYavhZOs6Y1pZuCxmbGPE4kGL
 zmgyuAko2rBlpJjICLIzY+mJuPObWGiLMhPF1c8rO4l18ixQmXg6rQ8X1dw2oFhmcdNtqxBEE
 t3BOGiKjaOpu1Gw0PAuSngIGX2by8crhf0ax/9gOUgkGs/FyC+dMbotEAsKqpcePjamcHyGnq
 zaCD/i8gRyzcPh0FeSGlwd6AlkZG0hG94ULncZ8TRaGZQubE3AzHLHINjROVPUxxcrOfXqqPa
 vB4s6N6NH0H4xb7QtLyH19Nz8QzRPvGRZ4Buv3XZuG+nyQirNLO9x+Bg78i+m3CFYRp5OZUuw
 lRD/GcNPUZkVkSLPHpEsqzwVg/ZMiF0IouyMeYI8An9cw26n48VaaeMXduyLtft6Lhs08MPPf
 tACTFmrIeCm5o+156L0a3Gu4gctO3sLvs5So9M3SLBDRaonJmbD7iDens7jUoati1tNjLbpo+
 lt4cSoDgO1Sk/b+VkbahoVoLMHztvKdLglF1tbKy/RuDCspSJCAG9DND5oap6D4WWB8Wyg6pr
 9cXhMZETjPC2RTpWQ7V3ycNs3y81cdEz0A3Od6avBqXrcja/fb2QgWdStsxtbH3ZHqJx5a5tA
 k2y5zelXyruRFN9MikHoraTj6oMm16PaKQi4oE8zs7/xfiSZFtNJjMkxUTIOvP4Q1iVaSq6Y5
 Zuv9uh4KtCBFAEehncTRMmYqxjwpHuEyYYz5Jk589km8a3pWEFvtSvDlbAn9+8PUWKcGRDmYj
 5Kla7HHJzwRzFXeK7s+HHuUz1fUxlPYBZBR/1AEJY6bmd53HL9Qgzq+A00Zy8RJylc09zGixz
 Urji45182qoBWFKC0lpADIIVZE62MR8HtwwXsfvV0MrmlY0JrjqxmiFDGOHQG1yKqRhA2i78p
 5UTKkUfPwzdjBPhxdRCVWTeL4eXbi2onrlQB6lYBToUsRJ82UzvrroXxu1U3xQznHe7UJxRcA
 NzitWnNlkllB79ePg2tVub5u3590FFc4QekWvR0qO14+CTZp3NRZKshYr1+HSrw2k+MI/dzYa
 1SuLzKjjwChFTZSVlWSH18GHgDhXX82j6xAJ6Xlm/V6oSrkNP5ZGYRYAqCFqutMTq+HMqoeVR
 e1zXBoUwk4yypd0VHx7nkdFL2z09bzCv7Y0T2UBmg16sBvfSBcivfzeLW968u2FvezYy1kpB5
 65ECf3EMKJW0qIM1ViGhKDlNACOGiEUDjzNx4qNDoLWiPqoq2ur5pIoO+pdpuAAgmC07+3AU8
 WTtu6MqYgRwXUL5BgNFNGOjTfFBeEdqtgHAWou3ZihgLY+b2dN0ppXIU5ZiQnynrxtTt2Vb7t
 kKxJD5xnkC9gkmpHsVPlz9T9Ap6sU/GlN8bT8b3HrayUJHwfCUrYv4nekQMYUNsZY6BQhXAUr
 y/Wd338rY5zHokMMHaIZl2JopGpMSLcDRTl5QlRRuNBWUWQhDxfkAp58/pK63bHhlwrMNguDg
 sQ7sX4lcbDy6V+ror+di4mG7N1c8sGHOT5M1uqBPhVd8Po74s4GBSUA5nYcVjFDFnfRWy+Uu8
 9UHxLaatMsl85Ywm1gDIr2oCLD9MSMRpE3XIGewV6piiPSYQ1fFjCauNypmow57opbQHRR1d5
 PNcITvn7q7Zwgv0lefCFmyMbQkprWV5yuhb8isS1SwIecQ/ZcMmp0d0Kb1vkOjaQqK4gYFo59
 C+/hMuuGCtCZSTh7DVM62zPM/8USAQBkztXd1ONr41lQLVL1AZg5IIU1agwDVpK0PhGsUdkar
 rcXcrd/IlstcdZ+4Pa1Gc1rgH9Gv2rS8wJqtO3FK4K3F5DVJrZNAq9RHLv51Gl6XOda9tpV4Z
 +O6Uj7xw/cKB5WuDjYsOeRzBoWEtX/YSQzyFtvyeiDKyWKyZAgVMy0FroKtetKcf/8Jzu61oJ
 Su9UJadkw5rQyAmY3FV1ga27KZ844XdrnSYTA+2G+O4RErrUjJ2e3b/gMPfzQvnXY/ro4hGqt
 ljnxqBEZfPO9Fo2DEK8UA1BBG07DFcRuoU2MQoH8VeQgYv+GMNDytciEr+dYIKf8G38DzSx5C
 zXdZB+xtplXGC8sEXhStSNCQRCQ3+K4cz67RRKtH1uNk3mZspEYKqw7GpkFcuwKJ2ZNs4swCu
 7QhqKArVyCsKr7XbvlpkCcblaJcF5HrsSUFE1FcAR89DVCiUCi9DDo9A19bgWXwbxsx7G89pz
 TuXqNp9bgCEEXcJtAYwJIqfsknvawvdZgC/58Ad5/gFRP8jf18nU86a1ReWs14BlzhiFZ4stI
 IUwGi8WVCbZpwVJOkTRfkpWuCyc7wyF+Oeg9q5+DWmWe62iKBsCuKcCk80vFwacjtHc9GB8S9
 WIi/+cM1DorD4tCm9n2BL0Mrz2MTRnPggYudwxwzP+q4/ZFL6lG3WDOfXFpfUenL41kRGCrfn
 8m3to+wV+E0/eqrmQnSxiHY7WveGpZseoixUoq+p2+lowqAK225LIGGXXSj3HJPxlB6SriPW0
 TSjhwIu9Oj0pH/p61tWCiBJ97AyxPY2lHQWUy+KU5gnLFuC9FAiEU4qg6yX4rzE2mi1m/EsR9
 m6LZ32RpsDl6E4vP4XLoAlXo1ki4WnmBFc/OZ6WuwRoEBwt8MqNPFwTpDFMqE9nk1qUf3bHZV
 n3u004EQ3nh/jUJ2g9+lS6+YnvuFwg6Bu+FdkZYaekEVVNomGMYsAnjplmc3FqLw/2APmAnhd
 h9O8zcw5ghmmXJFHeXYvmFKAoFGSbXyFLRoqQLHXTrhEkJmnyzyRAHiWO2O3WjalG1+mbGSJZ
 +1R4AYpY2jQGjKjSXE5OM9JjPlc0pJAscs16mSqqAyxJ9pkFOEPxzyB11JuN9kRom6kxU3/88
 G7o0UAmE2xKNdX1j8fw4rPYLe3aBHPJU9GpbzAy3dFD/ZvNGWNAGJQ5htpzNP/pgj/G/eju2g
 fimT1S89cGLT7GNCHFeEg8nuID7TTC9/AngdLtyjrCA3NbddOZwAZ3/JkddL+xAn1O8y25e2A
 mSeF0vO9bWXF8c0zGOvrRTrR7SbtRfEjI8XzCIfey85jwjo2LrVTLIMbV8+zPltntjZFYm3nb
 6op57FK0RwAqD3X9Abe8MHlUaz4LgY2nywwaKUHc6EfoIxW0alXAFqBINbTB/k61YyZMo2jBe
 tC+uL8rQ9hip6pUvRpyu4XChJulD7AlI/ZmaC5CwOYeEgD8Ew0kgFoS0FmFNhMoe+2HjpoJ58
 I6yY5YmXJGYwGSIiE81nIOo9ppWC1PEUc73O7E1ua9Y6BWTckaP7CiYCprSzDDzZFSMTmXdYX
 5K9mD4zmdxuMjr4oqJNgYnKM/iDTg49UFIhXEaDD9URyrZPD8sVXqiTdbjGSs8j21MHp42TZo
 Dr0uYOk2MJYrJLk8xq2uuh0Vx6lcdx7toMoDzLjySwUh2PQxd6IJm77SZuuGXT/Hradr8XCXT
 4W5YPfN6WUCqp5SMTdBcylhyeJYRYclJHopzhcD3idGw16RlK5mJR+xzghVHrl3UP/qAMuzSZ
 9r8kBE6gYvzTpnwMa/oml3iGEI/C1clMoKmfoHqvbq04cr9qDD7QAA1tdu1KeFF7xEg+ZU8gB
 tS1NoX9MFgvqIKo0frYV7t9n4js613hoJYhSaofbiP5NWM9/2G/10wYSZBgZe85toJbzXx9eF
 DBUOqxirU/iccqSKouvCVIsKmNmRnynZZWsZcgrEDbPbkacoji0Rj4DPYhneD0iGr25MRqbOW
 RCT5Xupz82tl7LlYINN6aSeM0HX+vnDaKoMQYFB+q0way3pVdhKYgcQNYRv28C5j8cIi3TEBa
 aZvH/rqRidNBUGCTr4cQ+lcfvKkoMriHN++SZtaYNREIxxGy5J3vQ4fMEsgysjWldv36zkyTP
 182LSGx52zCSQgotfanAY9PyZB+yCtGzwmWYEsnMXpJLldZH5ZwnYKI6d/QnfNVEwJPcXm/Ht
 /B4G/CpiJm60iBSVXQE80UP1kLFjgfSy+lz8c=

Hi Thorsten,

On 8/4/26 15:20, Thorsten Blum wrote:
> Include asm-generic/serial.h and use the generic BASE_BAUD definition
> instead of redefining it.
>=20
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>   arch/parisc/include/asm/serial.h | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)

Instead of sending 3 patches, isn't removing arch/parisc/include/asm/seria=
l.h
and adding the patch below the better approach?

Helge

diff --git a/arch/parisc/include/asm/Kbuild b/arch/parisc/include/asm/Kbui=
ld
index d48d158f7241..4fc315085914 100644
=2D-- a/arch/parisc/include/asm/Kbuild
+++ b/arch/parisc/include/asm/Kbuild
@@ -6,3 +6,4 @@ generic-y +=3D kvm_para.h
  generic-y +=3D mcs_spinlock.h
  generic-y +=3D ring_buffer.h
  generic-y +=3D user.h
+generic-y +=3D serial.h


