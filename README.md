# my-custom-plugin

Some text

## Install

```bash
npm install my-custom-plugin
npx cap sync
```

## API

<docgen-index>

* [`echo(...)`](#echo)
* [`setBackgroundColor(...)`](#setbackgroundcolor)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### echo(...)

```typescript
echo(options: { value: string; }) => Promise<{ value: string; }>
```

| Param         | Type                            |
| ------------- | ------------------------------- |
| **`options`** | <code>{ value: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### setBackgroundColor(...)

```typescript
setBackgroundColor(color: string) => Promise<boolean>
```

| Param       | Type                |
| ----------- | ------------------- |
| **`color`** | <code>string</code> |

**Returns:** <code>Promise&lt;boolean&gt;</code>

--------------------

</docgen-api>
